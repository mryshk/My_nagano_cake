class Admin::MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  private
	def member_params
	  params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
	end

end
