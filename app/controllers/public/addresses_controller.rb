class Public::AddressesController < ApplicationController


  def index
    
    @address = Address.new
  end
 
  def create
    
  end

  private

	def address_params
  	params.require(:address).permit(:name, :postal_code, :address)
  end

end
