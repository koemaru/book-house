class MypagesController < ApplicationController

  def index
    # binding.pry
    @user = User.find_by(id: current_user.id)
    @mybook_total = Book.where(user_id: current_user.id).pluck(:user_id).length
    @mybook_month = Book.where("created_at > ? and user_id = ?", Time.current.prev_month, current_user.id).pluck(:user_id).length
    @mybook_year = Book.where("created_at > ? and user_id = ?", Time.current.prev_year, current_user.id).pluck(:user_id).length

    @my_books = Book.where(user_id: current_user.id).order('created_at DESC')

    @like_count = Like.where(user_id: current_user.id).count
  end

  def destroy
    delete_book = Book.find(params[:id])
    delete_book.destroy
    redirect_to mypages_path
  end

end
