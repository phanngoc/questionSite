class VotesController < ApplicationController

  def index
  end

  def update
    if params[:id].to_i == Settings.vote.down
      if params.has_key? :comment_id
        result = remove_vote_comment
      else
        result = down_vote
      end    
    else
      if params.has_key? :comment_id
        result = up_vote_comment
      else
        result = up_vote
      end
    end
    
    render json: result
  end

  private

  def up_vote
    @answer = Answer.find_by id: params[:answer_id]
    
    if @answer.nil? || User.is_upvote_answer(current_user.id, params[:answer_id])
      result = {status: Settings.status.not_ok}
    else
      @answer.create_activity key: "answer.up_vote", owner: current_user
      if User.is_downvote_answer current_user.id, params[:answer_id]
        @answer.up_vote = @answer.up_vote + 2
      else
        @answer.up_vote = @answer.up_vote + 1
      end

      p = Action.create action_upvote_params
      p.save

      Action.by_user(current_user.id).target(:answer)
        .with_id(params[:answer_id]).is_downvote.destroy_all

      if @answer.save
        result = {status: Settings.status.ok, data: @answer}
      else
        result = {status: Settings.status.not_ok, data: @answer, 
          errors: @answer.errors}
      end
    end

    return result
  end

  def down_vote
    @answer = Answer.find_by id: params[:answer_id]

    if @answer.nil? || User.is_downvote_answer(current_user.id, params[:answer_id])
      result = {status: Settings.status.not_ok}
    else
      @answer.create_activity key: "answer.down_vote", owner: current_user
      if User.is_upvote_answer current_user.id, params[:answer_id]
        @answer.down_vote = @answer.down_vote + 2
      else
        @answer.down_vote = @answer.down_vote + 1
      end

      p = Action.create action_downvote_params
      p.save

      Action.by_user(current_user.id).target(:answer)
        .with_id(params[:answer_id]).is_upvote.destroy_all

      if @answer.save
        result = {status: Settings.status.ok, data: @answer}
      else
        result = {status: Settings.status.not_ok, data: @answer, 
          errors: @answer.errors}
      end
    end

    return result
  end

  def up_vote_comment
    @comment = Comment.find_by id: params[:comment_id]
    if @comment.present?
      @comment.up_vote = @comment.up_vote + 1
      @comment.create_activity key: "comment.up_vote", owner: current_user
      p = Action.create action_upvote_comment_params
      p.save

      if @comment.save
        result = {status: Settings.status.ok, data: @comment}
      else
        result = {status: Settings.status.not_ok, data: @comment, 
          errors: @comment.errors}
      end
    else
      result = {status: Settings.status.not_ok}
    end

    return result
  end

  def remove_vote_comment
    @comment = Comment.find_by id: params[:comment_id]
    if @comment.present?
      @comment.up_vote = @comment.up_vote - 1
      @comment.create_activity key: "comment.down_vote", owner: current_user
      Action.by_user(current_user.id).target(:comment)
        .with_id(params[:comment_id]).is_upvote.destroy_all

      if @comment.save
        result = {status: Settings.status.ok, data: @comment}
      else
        result = {status: Settings.status.not_ok, data: @comment, 
          errors: @comment.errors}
      end
    else
      result = {status: Settings.status.not_ok}
    end
    return result
  end

  def action_upvote_comment_params
    {actionable_id: params[:comment_id], actionable_type: :comment, 
      user_id: current_user.id, type_act: :up_vote}
  end

  def action_upvote_params
    {actionable_id: params[:answer_id], actionable_type: :answer, 
      user_id: current_user.id, type_act: :up_vote}
  end

  def action_downvote_params
    {actionable_id: params[:answer_id], actionable_type: :answer, 
      user_id: current_user.id, type_act: :down_vote}
  end
end
