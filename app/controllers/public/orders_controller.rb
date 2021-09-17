class Public::OrdersController < ApplicationController

  def index
     @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

   private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)
  end

end
