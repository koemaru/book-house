class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :get_category_children, :new_guest ]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @new_books = Book.order('created_at DESC').page(params[:page]).per(8)
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
    @selected_book = Book.find(params[:id])
    @user = @selected_book.user_id
    @recent_articles = Book.where(user_id: @selected_book.user_id).order('created_at DESC').limit(3)
  end

  def edit
    @book = Book.find(params[:id])
    @book_parent = Category.roots
    @book_root_category = @book.category.root
    @book_children_category = @book_root_category.children
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
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
    params.require(:book).permit(:book_title, :article, :image, :category_id, :article_title, :evaluation).merge(user_id: current_user.id)
  end

end
