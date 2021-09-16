class Admin::ProductsController < ApplicationController
  def new
   @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name,:genre_id,:explanation,:tax_out_price,:image,:is_active)
  end
end
