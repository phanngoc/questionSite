class UsersController < ApplicationController
  layout "main"
  respond_to :json, :html
  before_filter :authenticate_user!

  def index
  end

  def show
   @user = User.includes([:actions, :questions, {:answers => :question}, :comments]).find(params[:id])
   @numberQuestionsOfUser = @user.questions.count
   @numberAnswersOfUser = @user.answers.count
   @numberCommentsOfUser = @user.comments.count
  end

  def follow_user
    followObj = Action.create({:user_id => current_user.id,
                            :actionable_id => params[:id],
                            :actionable_type => 'User',
                            :type_act => :follow})
    debugger
    redirect_to :back
  end

  def un_follow
    followObj = Action.where({:user_id => current_user.id, :actionable_id => params[:id],
                  :actionable_type => 'User', :type_act => :follow}).destroy_all;
    redirect_to :back
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

end
