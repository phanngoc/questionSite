class HisansController < ApplicationController
  layout "main"

  def index
    @answer = Answer.find_by id: params[:answer_id]
    unless @answer
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @verans = Veran.includes(:user).by_an(params[:answer_id])
      .status(Verque.statuses[:approved])
    gon.page = Settings.page.approve_ques
  end
end
