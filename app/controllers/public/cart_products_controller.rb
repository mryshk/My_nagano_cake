class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all #カート内商品全て
    @member_cart_products = CartProduct.where(member_id: current_member.id) #自分が入れたカート内商品全て
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
    @cart_product.destroy #カート内商品1項目ずつ削除
    redirect_to public_cart_products_path
  end

  def destroy_all
     CartProduct.destroy_all #カート内商品全て削除
     redirect_to public_cart_products_path
  end

  private

  def create_cart_params #create用（カートに入れる用）のストロングパラメーター
    params.permit(:product_id,:member_id,:quantity)
  end
  def update_cart_params #update用（個数更新用）のストロングパラメーター
    params.require(:cart_product).permit(:product_id,:member_id,:quantity)
  end
end
