class HisquesController < ApplicationController
  layout "main"

  def index
    @question = Question.find_by id: params[:question_id]
    unless @question
      flash[:danger] = t "flash.question.not_found"
      redirect_to root_path
    end
    @verques = Verque.includes(:user).by_ques(params[:question_id])
      .status(Verque.statuses[:approved])

    gon.page = Settings.page.approve_ques
  end
end
