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

  private

  def question_params
    params.require(:question).permit :title, :content, :topics
  end

end
