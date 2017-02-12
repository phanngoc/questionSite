class UsersController < ApplicationController
  layout "main"
  respond_to :json, :html
  before_filter :authenticate_user!, :except => [:show]

  def index
  end

  def show
    @user = User.includes([:actions, :questions, {answers: :question}, :comments]).find(params[:id])
    @numberQuestionsOfUser = @user.questions.count
    @numberAnswersOfUser = @user.answers.count
    @numberCommentsOfUser = @user.comments.count
    @numberUserFollow = User.number_user_follow(params[:id])

    if user_signed_in?
      @isFollowUser = User.is_follow_user(params[:id], current_user.id)
    end

    @activities = PublicActivity::Activity.all
  end

  def follow_user
    followObj = Action.create({user_id: current_user.id,
                  actionable_id: params[:id],
                  actionable_type: "User",
                  type_act: :follow})
    if followObj.nil?
      result = {status: 0}
    else
      result = {status: 1}
    end

    render json: result
  end

  def unfollow_user
    followObj = Action.where({user_id: current_user.id, 
                  actionable_id: params[:id],
                  actionable_type: "User", 
                  type_act: :follow}).destroy_all;

    if followObj.nil? || followObj.length == 0
      result = {status: 0}
    else
      result = {status: 1}
    end

    render json: result
  end

  def remove_follow_topic
    objDelete = Action.where({user_id: current_user.id,
                  actionable_id: params[:id],
                  actionable_type: "Topic", 
                  type_act: :follow}).destroy_all;

    if objDelete.nil? || objDelete.length == 0
      result = {status: 0}
    else
      result = {status: 1}
    end

    render json: result
  end

  def add_follow_topic
    objInter = Action.create({user_id: current_user.id, 
                actionable_id: params[:id],
                actionable_type: "Topic", 
                type_act: :follow});

    if objInter.nil?
      result = {status: 0}
    else
      result = {status: 1}
    end

    render json: result
  end

end
