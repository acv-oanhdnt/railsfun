class ProductsController < ApplicationController
  def index
    @products = Product.published.includes(:category)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new 
  end
  
  def create
    product_params = params.require(:product).permit(:title,
                                                      :description,
                                                      :price,
                                                      :level,
                                                      :published,
                                                      :country,
                                                      :category_id)
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You have successfully created the product"
      redirect_to products_path
    else
      flash.now[:notice] = 'There is an error in your form'
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
    render :new
  end
  
  def update
    product_params = params.require(:product).permit(:title,
                                                      :description,
                                                      :price,
                                                      :level,
                                                      :published,
                                                      :country,
                                                      :category_id)
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "You have successfully created the product"
      redirect_to products_path
    else
      flash.now[:notice] = 'There is an error in your form'
      render :new
    end
  end
end