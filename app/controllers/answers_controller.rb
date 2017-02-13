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
      result = {status: 1}.to_json
    else
      result = {status: 0, errors: @answer.errors}.to_json
    end

    redirect_to question_path(params[:reply_to])
  end

  def update
    @answer = Answer.find_by id: params[:id];
    
    if @answer.present?
      @answer.content = params[:content];
      
      if @answer.save
        result = {status: 1}.to_json
      else
        result = {status: 0, errors: @answer.errors}.to_json
      end
    else
      result = {status: 0}  
    end    
    
    render :json => result
  end

  def up_vote
    if User.is_upvote_answer(current_user.id, params[:answer_id])
      result = {status: 0}
    else
      @answer = Answer.find(params[:answer_id])
      if User.is_downvote_answer(current_user.id, params[:answer_id])
        @answer.up_vote = @answer.up_vote + 2
      else
        @answer.up_vote = @answer.up_vote + 1
      end  
      
      
      p = Action.create action_upvote_params
      p.save

      p = Action.where(user_id: current_user.id,
            type_act: :down_vote,
            actionable_type: "Answer",
            actionable_id: params[:answer_id]).destroy_all

      if @answer.save
        result = {status: 1, data: @answer}
      else
        result = {status: 0, data: @answer, errors: @answer.errors}
      end
    end

    render :json => result
  end

  def down_vote
    if User.is_downvote_answer(current_user.id, params[:answer_id])
      result = {:status => 0}
    else
      @answer = Answer.find(params[:answer_id])

      if User.is_upvote_answer(current_user.id, params[:answer_id])
        @answer.down_vote = @answer.down_vote + 2
      else
        @answer.down_vote = @answer.down_vote + 1
      end  

      p = Action.create action_downvote_params
      p.save

      p = Action.where(user_id: current_user.id,
            type_act: :up_vote,
            actionable_type: "Answer",
            actionable_id: params[:answer_id]).destroy_all

      if @answer.save
        result = {status: 1, data: @answer}
      else
        result = {status: 0, data: @answer, errors: @answer.errors}
      end
    end

    render :json => result
  end

  private

  def answer_params
    params.permit :content, :reply_to
  end

  def action_upvote_params
    {actionable_id: params[:answer_id], actionable_type: "Answer", user_id: current_user.id, type_act: :up_vote}
  end

  def action_downvote_params
    {actionable_id: params[:answer_id], actionable_type: "Answer", user_id: current_user.id, type_act: :down_vote}
  end

end
