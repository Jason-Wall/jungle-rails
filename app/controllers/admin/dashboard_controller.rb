class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  def show
    @categories = Category
    .select('categories.*, COUNT(products.*) as products_count')
    .joins(:products)
    .group('categories.id')
    @category_count = Category.count
    
    @product_total = Product.count
                          
  end
end
