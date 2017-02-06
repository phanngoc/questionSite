class AnswersController < ApplicationController
  layout "main"
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

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

  def update
    @answer = Answer.find(params[:id]);
    @answer.content = params[:content];

    if @answer.save
      result = { :status => 1 }.to_json
    else
      result = { :status => 0 }.to_json
    end

    render :json => result
  end

  private

  def answer_params
    params.permit :content, :reply_to
  end
end
