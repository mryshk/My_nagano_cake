class Public::AddressesController < ApplicationController

  before_action :authenticate_member!

  def index
    @addresses = current_member.address
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    @addresses = current_member.address
    if @address.save
      redirect_to public_addresses_path
    end
  end

  def destroy
  end

  def edit
    
  end

  def update
  end

  private

	def address_params
  	params.require(:address).permit(:name, :postal_code, :address)
  end


end
