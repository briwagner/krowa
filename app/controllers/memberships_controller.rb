class MembershipsController < ApplicationController

  def create
    @membership = Membership.create(member_params)
    redirect_to :back
  end
  
  def destroy
    @membership = Membership.find_by(user_id: request_params[:user_id], group_id: request_params[:group_id])
    @membership.destroy
    redirect_to :back
  end

  private
  def member_params
    params.permit(:user_id, :group_id)
  end

end