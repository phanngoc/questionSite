class RequestsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  include ActionView::Helpers::TagHelper

  def index
    @users = load_popular_user
    render json: @users
  end

  def update
    action = Action.create request_user_params
    question = Question.find_by id: params[:question_id]

    eUser = content_tag(:a, current_user.name, href: user_path(current_user.id))
    teaser = "request to answer "
    eQuestion = content_tag(:a, question.title, href: question_path(question.id))
    content_noti = content_tag(:div, "#{eUser} #{teaser} #{eQuestion}", class: "noti-it")
    
    noti = {
      id: action.id,
      content: "#{content_noti}", 
      time: Time.now.to_i,
      is_read: 0,
      url: question_path(question.id)}
    RedisService.new.add_noti params[:id], noti 
    result = {status: Settings.status.ok}
    render json: result
  end


  private

  def load_popular_user
    question = Question.find_by id: params[:question_id]
    users_list = []
    question.topic_ids.each do |topic_id|
      users_list = users_list | RedisService.new.get_user_popular_topic(topic_id)
    end
    results = User.where(id: users_list).decorate.collect{|c| c.for_json};
    return results
  end

  def request_user_params
    {actionable_id: params[:id], actionable_type: Action.target_acts[:user],
      user_id: current_user.id, type_act: Action.type_acts[:request],
      param: {question_id: params[:question_id]}}
  end
end
