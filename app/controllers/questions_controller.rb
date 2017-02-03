class QuestionsController < ApplicationController
  layout "main"

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    @question = Question.create question_params
    @question.user_id = current_user.id
    @question.topic_ids = params[:question][:topics].reject { |c| c.empty? }.map(&:to_i)

    redirect_to question_path(@question.slug)
  end

  def show
    @question = Question.includes({:answers => [:user, {:comments => [:actions, :user]}] }, :user, {:comments => [:actions, :user]}).find(params[:id])

    gon.comments_path = comments_path
    gon.answers_path = answers_path
    gon.current_user = current_user
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

  private

  def question_params
    params.require(:question).permit :title, :content, :topics
  end

end
