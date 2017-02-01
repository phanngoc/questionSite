class AnswersController < ApplicationController
  layout "main"

  def index

  end

  def create
    @answer = Answer.create answer_params;
    
    @answer.user_id = current_user.id;
    if @answer.save
      result = { :status => 1 }.to_json
    else
      result = { :status => 0 }.to_json
    end

    redirect_to question_path(params[:reply_to])
  end

  private

  def answer_params
    params.permit :content, :reply_to
  end
end
