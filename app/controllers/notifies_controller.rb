class NotifiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    result = RedisService.new.noti_user(current_user.id);
    render json: result
  end

  def update
    result = RedisService.new.update_noti_isread params[:id], current_user.id
    render json: result
  end
end
