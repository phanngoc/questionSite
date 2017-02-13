class FotopicsController < ApplicationController
  before_filter :authenticate_user!

  def create
    if params[:type].to_i == Settings.topic.follow
      result = follow
    else
      result = unfollow
    end

    render json: result
  end
  
  private

  def follow
    followObj = Action.create({user_id: current_user.id,
      actionable_id: params[:topic_id],
      actionable_type: :topic,
      type_act: :follow})

    if followObj.nil?
      result = {status: Settings.status.not_ok}
    else
      result = {status: Settings.status.ok}
    end

    return result
  end

  def unfollow
    followObj = Action.where({user_id: current_user.id, 
      actionable_id: params[:topic_id],
      actionable_type: :topic, 
      type_act: :follow}).destroy_all;

    if followObj.nil? || followObj.length == 0
      result = {status: Settings.status.not_ok}
    else
      result = {status: Settings.status.ok}
    end

    return result
  end
end
