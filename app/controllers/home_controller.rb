class HomeController < ApplicationController
  layout "main"

  def index
    @topics = Topic.all

    if user_signed_in?
      @questions =  Question.new_feed_login(current_user.id, params[:page])
      @topicsFollow = Topic.topics_login_user current_user.id
    else
      @questions = Question.includes([:topics, :user, :actions]).paginate(:page => params[:page], :per_page => 1)
    end
  end

  def search
    @q = Question.ransack(title_or_content_cont: params[:word_search])
    @q.sorts = 'updated_at desc'
    @questions = @q.result.includes([:topics, :user, :actions]).page(params[:page])
  end

end
