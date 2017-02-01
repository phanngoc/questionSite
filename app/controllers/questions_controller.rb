class QuestionsController < ApplicationController
  layout "main"

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    @question = Question.create question_params
    @question.topic_ids = params[:question][:topics].reject { |c| c.empty? }.map(&:to_i)
  end

  def show
    @question = Question.includes({:answers => [:user, {:comments => :user}] }, :user, {:comments => :user}).find(params[:id])
    gon.comments_path = comments_path
    gon.answers_path = answers_path
    gon.current_user = current_user
    
    # ActiveRecord::Base.include_root_in_json = true
    # gon.question = @question.to_json(:include => [:user, :answers => {:include => :user}, :comments => {:include => :user}])
    # debugger
  end

  private

  def question_params
    params.require(:question).permit :title, :content, :topics
  end

end
