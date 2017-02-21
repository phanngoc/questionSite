class AnswersController < ApplicationController
  layout "main"
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  authorize_resource

  def index
  end

  def create
    @answer = Answer.create answer_params;
    @answer.user_id = current_user.id;
    if @answer.save
      @answer.create_activity key: Settings.activity.answer.create, owner: current_user
      result = {status: Settings.status.ok}.to_json
      UserMailer.notifyAnswer(Question.find(params[:reply_to])).deliver_later
    else
      result = {status: Settings.status.not_ok, errors: @answer.errors}.to_json
    end
    redirect_to question_path(params[:reply_to])
  end

  def update
    @answer = Answer.find_by id: params[:id];
    if @answer
      @answer.content = params[:content];
      if @answer.save
        @answer.create_activity key: Settings.activity.answer.update, owner: current_user
        result = {status: Settings.status.ok}.to_json
      else
        result = {status: Settings.status.not_ok, errors: @answer.errors}.to_json
      end
    else
      result = {status: Settings.status.not_ok}  
    end
    render json: result
  end

  def destroy
    @answer = Answer.destroy params[:id]
    if @answer.destroyed?
      result = {status: Settings.status.ok}
    else
      result = {status: Settings.status.not_ok}
    end  
    render json: result
  end

  private

  def answer_params
    params.permit :content, :reply_to
  end

end
