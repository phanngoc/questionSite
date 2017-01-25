class QuestionsController < ApplicationController
  layout "main"

  def new
    @question = Question.new
    @topics = Topic.all
  end

  def create
    Question.create question_params
  end

  private

  def question_params
    params.permit :title, :content
  end

end
