class FotopicsController < ApplicationController
  before_filter :authenticate_user!

  def create
    
    if params[:type].to_i == Settings.topic.follow
      result = follow
    else
      result = unfollow
    end

    redirect_to topic_path(params[:topic_id])
  end
  
  private

  def follow
    
    followObj = Action.create({user_id: current_user.id,
      actionable_id: params[:topic_id],
      actionable_type: "Topic",
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
      actionable_id: params[:topic_id],
      actionable_type: "Topic", 
      type_act: :follow}).destroy_all;

    if followObj.nil? || followObj.length == 0
      result = {status: 0}
    else
      result = {status: 1}
    end

    return result
  end
end
