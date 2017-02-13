class VotesController < ApplicationController

  def index
  end

  def update
    if params[:id].to_i == Settings.vote.down
      result = down_vote
    else
      result = up_vote
    end
    
    render json: result
  end

  
  private

  def up_vote
    @answer = Answer.find_by id: params[:answer_id]

    if @answer.nil? || User.is_upvote_answer(current_user.id, params[:answer_id])
      result = {status: 0}
    else
      if User.is_downvote_answer current_user.id, params[:answer_id]
        @answer.up_vote = @answer.up_vote + 2
      else
        @answer.up_vote = @answer.up_vote + 1
      end

      p = Action.create action_upvote_params
      p.save

      Action.by_user(current_user.id).target("Answer").with_id(params[:answer_id]).is_downvote.destroy_all

      if @answer.save
        result = {status: 1, data: @answer}
      else
        result = {status: 0, data: @answer, errors: @answer.errors}
      end
    end

    return result
  end

  def down_vote
    @answer = Answer.find_by id: params[:answer_id]

    if @answer.nil? || User.is_downvote_answer(current_user.id, params[:answer_id])
      result = {status: 0}
    else
      if User.is_upvote_answer current_user.id, params[:answer_id]
        @answer.down_vote = @answer.down_vote + 2
      else
        @answer.down_vote = @answer.down_vote + 1
      end

      p = Action.create action_downvote_params
      p.save

      Action.by_user(current_user.id).target("Answer").with_id(params[:answer_id]).is_upvote.destroy_all

      if @answer.save
        result = {status: 1, data: @answer}
      else
        result = {status: 0, data: @answer, errors: @answer.errors}
      end
    end

    return result
  end

  def action_upvote_params
    {actionable_id: params[:answer_id], actionable_type: "Answer", user_id: current_user.id, type_act: :up_vote}
  end

  def action_downvote_params
    {actionable_id: params[:answer_id], actionable_type: "Answer", user_id: current_user.id, type_act: :down_vote}
  end
end
