class VerquesController < ApplicationController
  layout "main"
  before_action :verify_admin_mod_owner, only: [:update, :index]
  authorize_resource
  include ActionView::Helpers::TagHelper

  def index
    @question = Question.find_by id: params[:question_id]
    unless @question
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    if params[:status] && params[:status] != Settings.version_page.all
      @verques = Verque.includes(:user).by_ques(params[:question_id])
        .status(params[:status])
    else
      @verques = Verque.includes(:user).by_ques(params[:question_id])
    end
    gon.page = Settings.page.approve_ques
  end

  def new
    @verque = Verque.find_newest params[:question_id]
    @question = Question.find_by(id: params[:question_id])
    unless @verque
      @verque = Verque.new(@question.attributes.slice("title", "content"))
    end
    @verques = Verque.version_by_quesid params[:question_id]
    gon.page = Settings.page.edit_ques
    gon.question = @question
  end

  def create
    @verque = Verque.find_newest params[:question_id]
    @question = Question.find_by(id: params[:question_id])

    unless @verque
      @verque = Question.find_by id: params[:question_id]
    end
    @verquetemp = Verque.create verque_params
    if @verquetemp
      redirect_to question_path(params[:question_id])
      if @question.user_id != current_user.id
        eUser = content_tag(:a, current_user.name, href: user_path(current_user.id))
        teaser = "edited your question in"
        eQuestion = content_tag(:a, @question.title, href: question_path(@question.id))
        content_noti = content_tag(:div, "#{eUser} #{teaser} #{eQuestion}", class: "noti-it")

        noti = {
          content: "#{content_noti}",
          time: Time.now.to_i,
          is_read: 0,
          url: question_path(@question.id)}
        RedisService.new.add_noti @question.user_id, noti

        ActionCable.server.broadcast "noti_user_#{@question.user_id}",
          noti: noti
      end
    end
  end

  def edit
    @verque = Verque.includes(:user).find_by id: params[:id]
    @question = Question.find_by(id: params[:question_id])
    unless @verque
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @verques = Verque.version_by_quesid params[:question_id]
    gon.page = Settings.page.edit_ques
    gon.question = @question
  end

  def update
    @verque = Verque.find_by id: params[:id]
    unless @verque
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @verque.update_attributes verque_update_params
    redirect_to :back
  end

  private

  def verify_admin_mod_owner
    question = Question.find_by id: params[:question_id]
    unless question && (current_user.admin? ||
      current_user.moderator? ||
      question.user_id = current_user.id)
      flash[:danger] = t "flash.question.verify_admin_mod_owner"
      redirect_to root_url
    end
	end

  def verque_update_params
    {status: params[:status]}
  end

  def verque_params
    params.require(:verque).permit(:title, :content)
      .merge(user_id: current_user.id,
      question_target: params[:question_id],
      status: Verque.statuses[:pending],
      version: Verque.max_ver + 1)
  end
end
