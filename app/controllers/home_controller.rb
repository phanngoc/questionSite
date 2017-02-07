class HomeController < ApplicationController
  layout "main"

  def index
    @topics = Topic.all
    if user_signed_in?
      @questions = Question.includes([:topics, :user, :actions]).new_feed_login current_user.id
      @topicsFollow = Topic.topics_login_user current_user.id
    else
      @questions = Question.includes([:topics, :user, :actions]).order(:updated_at)
    end
  end

  def search
    @q = Question.ransack(title_or_content_cont: params[:word_search])
    @q.sorts = 'updated_at desc'
    @questions = @q.result.includes([:topics, :user, :actions]).page(params[:page])
  end

end
