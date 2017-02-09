class Admin::UsersController < AdminController

  def index
    @users = User.all;
  end

  def edit
    @user = User.find params[:id]
  end

  def show

  end

  def update
    @user = User.find_by slug: params[:id]
    if @user.update_attributes user_params
      flash[:success] = t "flash.admin.user.update.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "flash.admin.user.update.failed"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :story, :avatar, :role
  end

end
