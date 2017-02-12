class QuestionsController < ApplicationController
  layout "main"
  before_filter :authenticate_user!, :except => [:show]

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    @question = Question.create question_params
    @question.user_id = current_user.id
    @question.topic_ids = params[:question][:topics].reject { |c| c.empty? }.map(&:to_i)
    @question.save

    @question.create_activity key: 'question.create', owner: current_user

    redirect_to question_path(@question.slug)
  end

  def show
    @question = Question.includes({answers: [:user, {comments: [:actions, :user]}] }, :user, {comments: [:actions, :user]}).find(params[:id])

    gon.comments_path = comments_path
    gon.answers_path = answers_path
    gon.current_user = current_user
    gon.new_user_session_path = new_user_session_path
  end

  def edit
    @question = Question.includes(:topics).find(params[:id])
    @topics = Topic.all
  end

  def update
    @question = Question.find_by_slug(params[:id])
    @question.update question_params
    @question.topic_ids = params[:question][:topics].reject { |c| c.empty? }.map(&:to_i)
    @topics = Topic.all

    redirect_to question_path
  end

  def up_vote
    if User.is_upvote_question(current_user.id, params[:question_id])
      result = {status: 0}
    else
      @question = Question.find(params[:question_id])
      if User.is_downvote_question(current_user.id, params[:question_id])
        @question.up_vote = @question.up_vote + 2
      else
        @question.up_vote = @question.up_vote + 1
      end

      p = Action.create action_upvote_params
      p.save

      p = Action.where(user_id: current_user.id,
            type_act: :down_vote,
            actionable_type: "Question",
            actionable_id: params[:question_id]).destroy_all

      if @question.save
        result = {status: 1, data: @question}
      else
        result = {status: 0, data: @question, errors: @question.errors}
      end
    end

    render :json => result
  end

  def down_vote
    if User.is_downvote_question(current_user.id, params[:question_id])
      result = {status: 0}
    else
      @question = Question.find(params[:question_id])

      if User.is_upvote_question(current_user.id, params[:question_id])
        @question.down_vote = @question.down_vote + 2
      else
        @question.down_vote = @question.down_vote + 1
      end

      p = Action.create action_downvote_params
      p.save

      p = Action.where(user_id: current_user.id,
            type_act: :up_vote,
            actionable_type: "Question",
            actionable_id: params[:question_id]).destroy_all

      if @question.save
        result = {status: 1, data: @question}
      else
        result = {status: 0, data: @question, errors: @question.errors}
      end
    end

    render :json => result
  end

  private

  def question_params
    params.require(:question).permit :title, :content, :topics
  end

  def action_upvote_params
    {actionable_id: params[:question_id], actionable_type: "Question", user_id: current_user.id, type_act: :up_vote}
  end

  def action_downvote_params
    {actionable_id: params[:question_id], actionable_type: "Question", user_id: current_user.id, type_act: :down_vote}
  end

end
