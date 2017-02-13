class CommentsController < ApplicationController
  layout "main"
  before_filter :authenticate_user!
  
  def index

  end

  def create
    @comment = Comment.includes(:user).create comment_question_params;

    @comment.user_id = current_user.id;
    if @comment.save
      comment = @comment.to_json(:include => [:user])
      result = {status: 1, data: comment}
      render json: result
    else
      comment = @comment.to_json(:include => [:user])
      result = {status: 0, data: comment, errors: @comment.errors}
      render json: result
    end
  end

  def update
    @comment = Comment.find_by id: params[:id]
    if @comment.present?
      if params.has_key? :act
        if params[:act].to_i == Settings.vote[:down]
            result = remove_vote
        else
          result = up_vote
        end
      else
        @comment.content = params[:content]
        if @comment.save
          result = {status: 1, data: @comment}
        else
          result = {status: 0, data: @comment, errors: @comment.errors}
        end
      end
    end

    render json: result
  end

  private

  def up_vote
    @comment = Comment.find_by id: params[:id]
    if @comment.present?
      @comment.up_vote = @comment.up_vote + 1

      p = Action.create action_upvote_params
      p.save

      if @comment.save
        result = {status: 1, data: @comment}
      else
        result = {status: 0, data: @comment, errors: @comment.errors}
      end
    else
      result = {status: 0}
    end    

    return result
  end

  def remove_vote
    @comment = Comment.find_by id: params[:id]
    if @comment.present?
      @comment.up_vote = @comment.up_vote - 1
      
      Action.by_user(current_user.id).target("Comment").with_id(params[:id]).is_upvote.destroy_all

      if @comment.save
        result = {status: 1, data: @comment}
      else
        result = {status: 0, data: @comment, errors: @comment.errors}
      end
    else
      result = {status: 0}
    end
    return result
  end

  def destroy
    Comment.destroy(params[:id])
    result = {status: 1}
    render json: result
  end

  def action_upvote_params
    {actionable_id: params[:id], actionable_type: "Comment", user_id: current_user.id, type_act: :up_vote}
  end

  def comment_question_params
    params.permit :content, :commentable_type, :commentable_id
  end
end
