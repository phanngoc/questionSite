class CommentsController < ApplicationController
  layout "main"

  def index

  end

  def create

    @comment = Comment.includes(:user).create comment_question_params;

    @comment.user_id = current_user.id;
    if @comment.save
      comment = @comment.to_json(:include => [:user])
      result = { :status => 1, :data => comment }
      render :json => result
    else
      comment = @comment.to_json(:include => [:user])
      result = { :status => 0, :data => comment }
      render :json => result
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]

    if @comment.save
      result = { :status => 1, :data => @comment }
    else
      result = { :status => 0, :data => @comment }
    end

    render :json => result
  end

  def up_vote
    @comment = Comment.find(params[:id])
    @comment.up_vote = @comment.up_vote + 1

    p = Action.create action_upvote_params
    p.save

    if @comment.save
      result = { :status => 1, :data => @comment }
    else
      result = { :status => 0, :data => @comment }
    end

    render :json => result
  end

  def remove_vote
    @comment = Comment.find(params[:id])
    @comment.up_vote = @comment.up_vote - 1
    
    p = Action.where(:user_id => current_user.id,
                     :type_act => :up_vote,
                     :actionable_type => 'Comment',
                     :actionable_id => params[:id]).destroy_all

    if @comment.save
      result = { :status => 1, :data => @comment }
    else
      result = { :status => 0, :data => @comment }
    end

    render :json => result
  end

  def destroy
    Comment.destroy(params[:id])
    result = { :status => 1 }
    render :json => result
  end

  def action_upvote_params
    {:actionable_id => params[:id], :actionable_type => 'Comment', :user_id => current_user.id, :type_act => :up_vote}
  end

  private

  def comment_question_params
    params.permit :content, :commentable_type, :commentable_id
  end
end
