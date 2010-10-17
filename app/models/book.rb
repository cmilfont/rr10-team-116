class Book < ActiveRecord::Base

  acts_as_taggable
  ajaxful_rateable :stars => 5
  @queue = :file_serve

  belongs_to :user
  validates_presence_of :user

  has_many :pages, :dependent => :destroy

  has_attached_file :file

  searchable do
    text :tag_list
    text :author
    text :title
    text :edition
    text :publisher
    text :year
  end

  def process(book_id)
    book = Book.find(book_id)

    url = RAILS_ROOT + "/public" + book.file.url
  	receiver = PageTextReceiver.new
    pdf = PDF::Reader.file(url, receiver)
    page_number = 0
    receiver.content.each{|page|
      page_number += 1
      book.pages << Page.new(:content => page, :page_number => page_number)
    }
    book.save
    Sunspot.index book.pages
  rescue Exception => e
    book.index_erro = e.message
  end
  
  def large_image_path
    if cover_img_uuid
      Book.cover_dir + "/cover_#{cover_img_uuid}_large.png"
    else
      "cover_large.png"
    end
  end
  
  def small_image_path
    if cover_img_uuid
      Book.cover_dir + "/cover_#{cover_img_uuid}_small.png"
    else
      "cover_small.png"
    end  
  end
  
  def thumb_image_path
    if cover_img_uuid
      Book.cover_dir + "/cover_#{cover_img_uuid}_thumb.png"
    else
      "cover_thumb.png"
    end
  end
  
  
  def file_full_path
    RAILS_ROOT + "/public" + file.url    
  end
    
  def self.cover_dir
     return "/images/covers"  
  end
  
  def self.full_cover_dir
    return RAILS_ROOT + "/public"+ cover_dir
  end

  def self.recent_books
    return Book.find(:all, :conditions => ["cover_img_uuid <> ?", nil], :order => "created_at DESC")
  end

  def self.top_rated_books
    return Book.find(:all, :conditions => ["cover_img_uuid <> ?", nil], :order => "rating_average DESC")
  end

  class << self

    def queue
      @queue
    end

    def queue=( new_queue )
      @queue = new_queue
    end

    def deliver(id)
      Resque.enqueue(Book, id)
      Resque.enqueue(GenerateBookCover, id)      
    end
                
    def perform(id)
      new().process(id)
    end

  end

end

