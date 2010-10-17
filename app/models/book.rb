class Book < ActiveRecord::Base

  acts_as_taggable
  ajaxful_rateable :stars => 10
  @queue = :file_serve

  belongs_to :user
  validates_presence_of :user

  has_many :pages, :dependent => :destroy

  has_attached_file :file

  searchable do
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
    Book.cover_dir + "/cover_#{cover_img_uuid}_large.png"
  end
  
  def small_image_path
    Book.cover_dir + "/cover_#{cover_img_uuid}_small.png"
  end
  
  def thumb_image_path
    Book.cover_dir + "/cover_#{cover_img_uuid}_thumb.png"
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

