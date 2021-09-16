class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    current_user.id = @cart_product.member_id
    @product.id = @cart_product.product_id

    @cart_product.save
  end

  def update
  end

  def destroy
  end

  def destroy_all
    CartProducts.all.destroy
  end
end
