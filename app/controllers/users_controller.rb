class UsersController < ApplicationController
  layout "main"
  respond_to :json, :html

  def index
    @users = User.order(:name).page(params[:page]).per(2)
    @user = current_user
  end

  def show
   @user = User.find(params[:id])
   render json:@user
 end
end
