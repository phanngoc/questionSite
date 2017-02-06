class Action < ApplicationRecord
  belongs_to :actionable, polymorphic: true
  enum type_act: [ :down_vote, :up_vote, :share_fa, :share_tw, :follow ], _suffix: true

  delegate :url_helpers, to: 'Rails.application.routes'

  def obj_down_vote
    if self.actionable_type == "Question"
      return Question.find(self.actionable_id)
    elsif self.actionable_type == "Answer"
      return Question.find(Answer.includes(:question).find(self.actionable_id).question.id)
    end
  end

  def obj_up_vote
    if self.actionable_type == "Question"
      return Question.find(self.actionable_id)
    elsif self.actionable_type == "Answer"
      return Question.find(Answer.includes(:question).find(self.actionable_id).question.id)
    elsif self.actionable_type == "Comment"
      return Comment.find(self.actionable_id).final_question
    end
  end

  def obj_follow
    if self.actionable_type == "Topic"
      return {link: url_helpers.topic_path(self.actionable_id), name: Topic.find(self.actionable_id).name}
    elsif self.actionable_type == "User"
      return {link: url_helpers.user_path(self.actionable_id), name: User.find(self.actionable_id).name}
    end
  end

  def info
    name = User.find(self.user_id).name

    case self.type_act.to_sym
    when :down_vote
      ques = obj_down_vote
      "<strong>#{name}</strong> is down vote on <a href='#{url_helpers.question_path(ques.id)}' >#{ques.title}</a>"
    when :up_vote
      ques = obj_up_vote
      "<strong>#{name}</strong> is up vote on <a href='#{url_helpers.question_path(ques.id)}' >#{ques.title}</a>"
    when :share_fa

    when :share_tw

    when :follow
      target = obj_follow
      "<strong>#{name}</strong> follow on topic <a href='#{target[:link]}' >#{target[:name]}</a>"
    else
      "We don't have info"
    end
  end

end
