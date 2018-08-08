class ProductsController < ApplicationController
  def index
    @products = Product.published.includes(:category)
  end
  
  def show
    @product = Product.find(params[:id])
  end
end