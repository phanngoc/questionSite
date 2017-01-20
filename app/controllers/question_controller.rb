class QuestionController < ApplicationController
  layout "main"

  def ask

    render "questions/ask"
  end
end
