class PopularsController < ApplicationController
  layout "main"
  before_filter :authenticate_user!, :except => [:show]
  
  def index
    @users = load_popular_user
    render json: @users
  end

  private

  def load_popular_user
    question = Question.find_by id: params[:question_id]
    redis = Redis.new(host: "127.0.0.1", port: 6379)
    users_list = []
    question.topic_ids.each do |topic_id|
      users_list = users_list | redis.zrange("popular_topic_#{topic_id}", 0, -1)
    end
    return users_list
  end
  
  def question_params
    params.require(:question).permit :title, :content, :topics
  end

  def action_upvote_params
    {actionable_id: params[:id], actionable_type: Action.target_acts[:question],
      user_id: current_user.id, type_act: :up_vote}
  end

  def action_downvote_params
    {actionable_id: params[:id], actionable_type: Action.target_acts[:question],
      user_id: current_user.id, type_act: :down_vote}
  end
end
