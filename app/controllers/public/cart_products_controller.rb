class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
    @member_cart_products = CartProduct.where(member_id: current_member.id)
  end

  def create
    @cart_product = CartProduct.new(create_cart_params)
    @cart_product.save
    redirect_to public_cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(update_cart_params)
    redirect_to public_cart_products_path
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
  def create_cart_params
    params.permit(:product_id,:member_id,:quantity)
  end
  def update_cart_params
    params.require(:cart_product).permit(:product_id,:member_id,:quantity)
  end
end
