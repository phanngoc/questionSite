class UserMailer < ApplicationMailer
  def notifyAnswer(question)
    @question = question
    mail to: question.user.email
  end

  def sumQuestionLastDay(email, topics)
    @topics = topics
    mail to: email
  end
end
