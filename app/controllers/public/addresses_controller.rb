class Public::AddressesController < ApplicationController

  before_action :authenticate_member!

  def index
    @addresses = current_member.address
    @addresses = Address.all
    @member_addresses = Address.where(member_id: current_member.id)
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
    @address = Address.find(params[:id])
    @addresses = current_member.address
    @address.destroy
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      render "edit"
    end
  end

  private

	def address_params
  	params.require(:address).permit(:name, :postal_code, :address)
  end


end
