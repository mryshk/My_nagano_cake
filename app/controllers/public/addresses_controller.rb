class Public::AddressesController < ApplicationController
  before_action :authenticate_member!
  
  def index
    @addresses = current_member.address
    @address = Address.new
  end
  
  
  
  private

	def address_params
  	params.require(:address).permit(:name, :postal_code, :address)
  end
  
end
