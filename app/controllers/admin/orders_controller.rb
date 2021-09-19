class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @product = Product.find(params[:product_id])
    @address = Address.find(params[:address_id])
  end

  private

  def orders_params
    params.require(:order).permit(:member_id,:shipping_price,:total_payment,:payment_method,:name,:address,:postal_code,:status)
  end

end
