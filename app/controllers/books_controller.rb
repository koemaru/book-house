class BooksController < ApplicationController

  def index
    @new_books = Book.order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render new_book_path
    end
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :article, :image)
  end

end
