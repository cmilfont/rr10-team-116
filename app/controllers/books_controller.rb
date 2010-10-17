class BooksController < ApplicationController

  before_filter :require_user, :only => [:new, :create, :edit, :destroy, :rate,
    :update, :mybooks]


    def tag_cloud
      @tags = Book.tag_counts_on(:tags)
    end

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
      require_owner(@book)
    end

    def show
      @book = Book.find(params[:id])
      @books = Book.all
    end

    def update
      @book = Book.find(params[:id])
      respond_to do |format|
        Sunspot.remove @book
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
      
      @tags = Book.tag_counts_on(:tags)
    end

    def search_books
      page = params[:page]? params[:page].to_i : 1
      per_page = params[:per_page]? params[:per_page].to_i : 5
      @query = params[:query]
      query = @query
      resultados = Sunspot.search(Book) do
        keywords(query)
        paginate(:page => page, :per_page => per_page)
      end
      @books = resultados.results
    end

    def search_mybooks
      page = params[:page]? params[:page].to_i : 1
      per_page = params[:per_page]? params[:per_page].to_i : 5

      @query = params[:query]
      user = current_user
      query = @query
      resultados = Sunspot.search(Book) do
        keywords(query)
        #   with(:user_id, user.id)
        paginate(:page => page, :per_page => per_page)
      end
      @books = resultados.results

      render :action => "mybooks"
    end


    def search_books_by_user
      page = params[:page]? params[:page].to_i : 1
      per_page = params[:per_page]? params[:per_page].to_i : 5

      @query = params[:query]
      user = User.find(params[:id])
      query = @query
      resultados = Sunspot.search(Book) do
        keywords(query)
        with(:user_id, user.id)
        paginate(:page => page, :per_page => per_page)
      end
      @books = resultados.results

      render :action => "books_by_user"
    end

    def destroy
      @book = Book.find(params[:id])

      if require_owner(@book)
        Sunspot.remove @book
        @book.destroy

        respond_to do |format|
          format.html { redirect_to(books_url) }
          format.xml  { head :ok }
        end
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

    def mybooks
      @books = Book.find(:all, :conditions => {:user_id => current_user.id})
      respond_to do |format|
        format.html
        format.xml  { render :xml => @books }
      end
    end

    def rate
      @book = Book.find(params[:id])
      @book.rate(params[:stars], current_user)
      render :update do |page|
        page.replace_html @book.wrapper_dom_id(params),  ratings_for(@book)
      end
    end

    private
    def require_owner(book)
      unless current_user.owner_of(book)
        store_location
        flash[:notice] = "You must be owner to access this page"
        redirect_to :controller => "user_sessions", :action => "new"
        return false
      end
      return true
    end

  end

