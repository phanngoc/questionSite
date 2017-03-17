class VeransController < ApplicationController
  layout "main"
  before_action :verify_admin_mod_owner, only: [:update, :index]
  authorize_resource
  include ActionView::Helpers::TagHelper

  def index
    @answer = Answer.find_by id: params[:answer_id]
    unless @answer
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    if params[:status] && params[:status] != Settings.version_page.all
      @verans = Veran.includes(:user).by_an(params[:answer_id])
        .status(params[:status])
    else
      @verans = Veran.includes(:user).by_an(params[:answer_id])
    end
    gon.page = Settings.page.approve_ques
  end

  def new
    @veran = Veran.find_newest params[:answer_id]
    @answer = Answer.find_by(id: params[:answer_id])
    unless @veran
      @veran = Veran.new(@answer.attributes.slice("content"))
    end
    @verans = Veran.version_by_ansid params[:answer_id]
    gon.page = Settings.page.edit_ques
    gon.answer = @answer
  end

  def create
    @veran = Veran.find_newest params[:answer_id]
    answer = Answer.find_by id: params[:answer_id]
    unless @veran
      @veran = answer
    end
    @verantemp = Veran.create veran_params
    if @verantemp
      redirect_to question_path(answer.question)
    end

    if answer.user_id != current_user.id
      eUser = content_tag(:a, current_user.name, href: user_path(current_user.id))
      teaser = "edited your answer in"
      eQuestion = content_tag(:a, answer.question.title, href: question_path(answer.question.id))
      content_noti = content_tag(:div, "#{eUser} #{teaser} #{eQuestion}", class: "noti-it")
      noti = {
        content: "#{content_noti}",
        time: Time.now.to_i,
        is_read: 0,
        url: question_path(answer.question.id)}
      RedisService.new.add_noti answer.user_id, noti
      ActionCable.server.broadcast "noti_user_#{answer.user_id}",
        noti: noti
    end
  end

  def edit
    @veran = Veran.includes(:user).find_by id: params[:id]
    @answer = Answer.find_by(id: params[:answer_id])
    unless @veran
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @verans = Veran.version_by_ansid params[:answer_id]
    gon.page = Settings.page.edit_ques
    gon.answer = @answer
  end

  def update
    @veran = Veran.find_by id: params[:id]
    unless @veran
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @veran.update_attributes veran_update_params
    redirect_to :back
  end

  private

  def verify_admin_mod_owner
    answer = Answer.find_by id: params[:answer_id]
    unless answer && (current_user.admin? ||
      current_user.moderator? ||
      answer.user_id = current_user.id)
      flash[:danger] = t "flash.question.verify_admin_mod_owner"
      redirect_to root_url
    end
  end

  def veran_update_params
    {status: params[:status]}
  end

  def veran_params
    params.require(:veran).permit(:content)
      .merge(user_id: current_user.id,
      answer_target: params[:answer_id],
      status: Veran.statuses[:pending],
      version: Veran.max_ver + 1)
  end
end
