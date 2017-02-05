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

  def remove_follow_topic
    objDelete = Action.where({:user_id => current_user.id, :actionable_id => params[:id], 
                  :actionable_type => 'Topic', :type_act => :follow}).destroy_all;

    if objDelete.nil?
      result = {:status => 0}  
    else
      result = {:status => 1}
    end
    
    render :json => result
  end

  def add_follow_topic
    objInter = Action.create({:user_id => current_user.id, :actionable_id => params[:id], 
                  :actionable_type => 'Topic', :type_act => :follow});
    
    if objInter.nil?
      result = {:status => 0}  
    else
      result = {:status => 1}
    end

    render :json => result
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :avatar)
  end

end
