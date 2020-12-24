class CategoriesController < ApplicationController

  def show
    @categories = Category.where(ancestry: nil)
    @categories_1 = Category.where(ancestry: 1)
    @categories_2 = Category.where(ancestry: 2)
    @categories_3 = Category.where(ancestry: 3)
    @categories_4 = Category.where(ancestry: 4)
    @categories_5 = Category.where(ancestry: 5)
    @categories_6 = Category.where(ancestry: 6)
    @categories_7 = Category.where(ancestry: 7)

    @category = Category.find(params[:id])
    @category_books = @category.books.order('created_at DESC')
  end

end
