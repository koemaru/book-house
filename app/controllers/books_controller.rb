class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :get_category_children ]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @new_books = Book.order('created_at DESC')
    @categories = Category.where(ancestry: nil)
    @categories_1 = Category.where(ancestry: 1)
    @categories_2 = Category.where(ancestry: 2)
    @categories_3 = Category.where(ancestry: 3)
    @categories_4 = Category.where(ancestry: 4)
    @categories_5 = Category.where(ancestry: 5)
    @categories_6 = Category.where(ancestry: 6)
    @categories_7 = Category.where(ancestry: 7)
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
    # binding.pry
    @selected_book = Book.find(params[:id])
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
    params.require(:book).permit(:book_title, :article, :image, :category_id, :article_title)
  end

end
