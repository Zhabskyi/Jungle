class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Product.group(:category_id).count
  end
end
