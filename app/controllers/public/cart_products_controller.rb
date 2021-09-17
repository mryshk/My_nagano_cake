class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new(cart_params)
    @cart_product.save
    redirect_to public_cart_products_path
  end

  def update
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def destroy_all
     CartProduct.destroy_all
     redirect_to public_cart_products_path
  end

  private
  def cart_params
    params.permit(:product_id,:member_id)
  end
end
