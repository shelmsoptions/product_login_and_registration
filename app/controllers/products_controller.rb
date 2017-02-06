class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def create
    product = Product.new( product_params )
    product.user_id = session[:user_id]
    if product.valid?
      product.save
      redirect_to "/products"
    else
      redirect_to "/products/new"
    end
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
