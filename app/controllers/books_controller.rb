class BooksController < ApplicationController

  before_filter :require_user, :only => [:new, :create, :edit, :rate, :update, :mybooks]



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
      format.xml  { render :xml => @books }
    end
  end

  def books_by_user
    @user = User.find(params[:id])
    @books = Book.find(:all, :conditions => {:user => @user})
    respond_to do |format|
      format.html
      format.xml  { render :xml => @books }
    end  
  end

  def my_books
    @books = Book.find(:all, :conditions => {:user => current_user})
    respond_to do |format|
      format.html
      format.xml  { render :xml => @books }
    end
  end

  def rate
    @book = Book.find(params[:id])
    @book.rate(params[:stars], current_user)
    render :update do |page|
      puts "******************  @book.wrapper_dom_id(params): #{ @book.wrapper_dom_id(params)}"
      page.replace_html @book.wrapper_dom_id(params), "asdsads" # ratings_for(@book)
      #   page.visual_effect :highlight, @book.wrapper_dom_id(params)
    end
  end

end
