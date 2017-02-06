class HomeController < ApplicationController
  layout "main"

  def index
    @topics = Topic.all
    if user_signed_in?
      @topicsFollow = Topic.topics_login_user current_user.id
      @questions = Question.includes([:topics, :user, :actions]).order(:updated_at)
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
