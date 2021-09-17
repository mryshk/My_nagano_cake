class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end


  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to public_member_path(@member)
  end

  private
  def member_params
    params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number,:postal_code,:address,:email)
  end
end
