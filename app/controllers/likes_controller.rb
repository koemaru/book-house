class LikesController < ApplicationController
  before_action :set_book

  def create
    @like = current_user.likes.create(book_id: params[:book_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @like = current_user.likes.find_by(book_id: @book.id)
    @like.destroy
  end

  private

  def set_book
    @like_book = Book.find(params[:book_id])
  end

end
