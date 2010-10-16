class BooksController < ApplicationController

  def new
    @book = Book.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book saved successfully!'
        format.html { redirect_to(@book) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def index
    @book = Book.all

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @book }
    end
  end

end

