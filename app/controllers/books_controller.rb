class BooksController < ApplicationController

  def new
    @book = Book.new
    respond_to do |format|
      format.html
    end
  end

end

