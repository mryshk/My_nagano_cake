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
    @products = Product.all.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product.id)

  end

  private

  def product_params
    params.require(:product).permit(:name,:genre_id,:explanation,:tax_out_price,:image,:is_active)
  end
end
