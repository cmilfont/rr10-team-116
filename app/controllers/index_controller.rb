class IndexController < ApplicationController
  def index
    @tags = Book.tag_counts_on(:tags)
  end
  
  def tag
    tag = params[:id]
    @books = Book.tagged_with(tag)
    @tags = Book.tag_counts_on(:tags)
    
    render :controller => :books, :action => :index
    
    
  end
end
