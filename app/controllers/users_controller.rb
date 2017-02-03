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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :avatar)
  end

end
