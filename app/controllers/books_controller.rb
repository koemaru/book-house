class BooksController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

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

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  private

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def book_params
    params.require(:book).permit(:title, :article, :image)
  end

end
