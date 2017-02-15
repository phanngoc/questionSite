class UsersController < ApplicationController
  layout "main"
  respond_to :json, :html
  before_filter :authenticate_user!, :except => [:show]

  def index
  end

  def show
    @user = User.includes([:actions, :questions, {answers: :question}, :comments])
      .find_by id: params[:id]

    unless @user
      flash[:danger] = t "flash.user.not_found"
      redirect_to root_path
    end
    @numberQuestionsOfUser = @user.questions.count
    @numberAnswersOfUser = @user.answers.count
    @numberCommentsOfUser = @user.comments.count
    @numberUserFollow = User.number_user_follow(params[:id])

    @activities = User.activity_by_user(params[:id])
      .paginate(:page => params[:page],
      per_page: Settings.profile.activity.per_page)
    
    if user_signed_in?
      @isFollowUser = User.is_follow_user(params[:id], current_user.id)
    end
  end
end
