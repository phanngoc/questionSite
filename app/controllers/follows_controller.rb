class FollowsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:type] == Settings.user.follow
      result = follow
    else
      result = unfollow
    end

    render json: result
  end
  
  private

  def follow
    followObj = Action.create({user_id: current_user.id,
      actionable_id: params[:id],
      actionable_type: "User",
      type_act: :follow})
    if followObj.nil?
      result = {status: 0}
    else
      result = {status: 1}
    end

    return result
  end

  def unfollow
    followObj = Action.where({user_id: current_user.id, 
      actionable_id: params[:id],
      actionable_type: "User", 
      type_act: :follow}).destroy_all;

    if followObj.nil? || followObj.length == 0
      result = {status: 0}
    else
      result = {status: 1}
    end

    return result
  end
end
