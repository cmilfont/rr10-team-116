class Book < ActiveRecord::Base

  acts_as_taggable
  ajaxful_rateable :stars => 10
  @queue = :file_serve

  belongs_to :author
  has_many :pages, :dependent => :destroy

  has_attached_file :file

  searchable do
    text :author do
      author.name
    end
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
  end

  class << self

    def queue
      @queue
    end

    def queue=( new_queue )
      @queue = new_queue
    end

    def deliver( id )
      Resque.enqueue(Book, id )
    end

    def perform( id )
      new().process(id)
    end

  end

end

