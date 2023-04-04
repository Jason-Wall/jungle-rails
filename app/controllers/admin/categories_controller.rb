class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category
    .select('categories.*, COUNT(products.*) as products_count')
    .joins(:products)
    .group('categories.id')
    @category_count = Category.count
    
    @product_total = Product.count
  end

  def new
  end

  def create
  end
end
