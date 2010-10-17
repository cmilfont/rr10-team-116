class IndexController < ApplicationController
  def index
    @books = Book.all
  end
end
