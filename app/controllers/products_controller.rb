class ProductsController < ApplicationController
  def index
    @products = Product.published.includes(:category)
  end
end