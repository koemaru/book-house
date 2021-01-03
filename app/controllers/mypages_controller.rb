class MypagesController < ApplicationController

  def index
    @user = User.find_by(id: current_user.id)
    @mybook_total = Book.where(user_id: current_user.id).pluck(:user_id).length
    @mybook_month = Book.where("created_at > ? and user_id = ?", Time.current.prev_month, current_user.id).pluck(:user_id).length
    @mybook_year = Book.where("created_at > ? and user_id = ?", Time.current.prev_year, current_user.id).pluck(:user_id).length

    @my_books = Book.where(user_id: current_user.id).order('created_at DESC').page(params[:page]).per(4)

    @like_books = Book.where(user_id: current_user.id)
    @like_count = 0
    @like_books.each do |book|
      count = 0
      count = Like.where(book_id: book.id).count
      @like_count = count + @like_count
    end
  end

  def destroy
    delete_book = Book.find(params[:id])
    delete_book.destroy
    redirect_to mypages_path
  end

end
