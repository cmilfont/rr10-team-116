class BooksController < ApplicationController

  def new
    @book = Book.new
    @books = Book.all
    respond_to do |format|
      format.html
    end
  end

  def create
    @book = Book.new(params[:book])
    @book.user = current_user if current_user
    respond_to do |format|
      if @book.save
        Book.deliver(@book.id)
        flash[:notice] = 'Book saved successfully!'
        format.html { redirect_to(@book) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end
  
  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update_attributes(params[:book])
        Book.deliver(@book.id)
        flash[:notice] = 'Book saved successfully!'
        format.html { redirect_to(@book) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @book }
    end
  end

  def rate
    @book = book.find(params[:id])
    @book.rate(params[:stars], current_user)
    #render :update do |page|
     # page.replace_html @car.wrapper_dom_id(params), ratings_for(@car, params.merge(:wrap => false))
     # page.visual_effect :highlight, @car.wrapper_dom_id(params)
    #end
  end

end