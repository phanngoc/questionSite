class Action < ApplicationRecord

  include PublicActivity::Model
  
  belongs_to :actionable, polymorphic: true
  enum type_act: [:down_vote, :up_vote, :share_fa, :share_tw, :follow], _suffix: true

  enum target_act: {answer: "Answer", question: "Question", topic: "Topic", comment: "Comment", user: "User"}

  delegate :url_helpers, to: "Rails.application.routes"

  scope :by_user, ->user_id{where user_id: user_id}

  scope :target, ->type{where actionable_type: type}

  scope :with_id, ->id{where actionable_id: id}

  scope :is_upvote, ->{where type_act: Action.type_acts[:up_vote]}

  scope :is_downvote, ->{where type_act: Action.type_acts[:down_vote]}

  scope :is_follow, ->{where type_act: Action.type_acts[:follow]}

  scope :numberFollow, -> topic_id do
    where(actionable_id: topic_id, actionable_type: Action.target_acts[:topic],
      type_act: Action.type_acts[:follow])
  end

  scope :follow_user, -> user_id do
    where(actionable_id: topic_id, actionable_type: Action.target_acts[:topic],
      type_act: Action.type_acts[:follow])
  end

  scope :is_upvote_answer, -> (current_user_id, answer_id) do
    where "user_id = ? and actionable_type = ? and actionable_id = ?
    and type_act = ?", current_user_id, :answer, answer_id,
    Action.type_acts[:up_vote] ;
  end

  scope :is_downvote_answer, -> (current_user_id, answer_id) do
    where "user_id = ? and actionable_type = ? and actionable_id = ?
    and type_act = ?", current_user_id, :answer, answer_id,
    Action.type_acts[:down_vote] ;
  end

  scope :is_upvote_question, -> (current_user_id, question_id) do
    where "user_id = ? and actionable_type = ? and actionable_id = ?
    and type_act = ?", current_user_id, :question, question_id,
    Action.type_acts[:up_vote] ;
  end

  scope :is_downvote_question, -> (current_user_id, question_id) do
    where "user_id = ? and actionable_type = ? and actionable_id = ?
    and type_act = ?", current_user_id, :question, question_id,
    Action.type_acts[:down_vote] ;
  end

  def destroy_question_down current_user_id, question_id
    Action.where(user_id: current_user_id,
      type_act: :down_vote,
      actionable_type: :question,
      actionable_id: question_id).destroy_all
  end

  def destroy_question_up current_user_id, question_id
    Action.where(user_id: current_user_id,
      type_act: :up_vote,
      actionable_type: :question,
      actionable_id: question_id).destroy_all
  end

  def obj_down_vote
    if self.actionable_type == "Question"
      return Question.find_by id: self.actionable_id
    elsif self.actionable_type == "Answer"
      answer = Answer.includes(:question).find_by id: self.actionable_id
      if answer.present?
        return Question.find_by id: answer.question.id
      end  
    end
  end

  def obj_up_vote
    if self.actionable_type == "Question"
      return Question.find_by id: self.actionable_id
    elsif self.actionable_type == "Answer"
      answer = Answer.includes(:question).find_by id: self.actionable_id
      if answer.present?
        return Question.find_by id: answer.question.id
      end
    elsif self.actionable_type == "Comment"
      comment = Comment.find_by id: self.actionable_id
      if comment.present?
        return comment.final_question  
      end
    end
  end

  def obj_follow
    if self.actionable_type == "Topic"
      topic = Topic.find_by id: self.actionable_id
      if topic.present?
        return {link: url_helpers.topic_path(self.actionable_id), name: topic.name}
      end
    elsif self.actionable_type == "User"
      user = User.find_by id: self.actionable_id
      if user.present?
        return {link: url_helpers.user_path(self.actionable_id), name: user.name}
      end
    end
  end

  def info
    name = User.find(self.user_id).name

    case self.type_act.to_sym
    when :down_vote
      ques = obj_down_vote
      I18n.t("user.show.action.downvote", name: name, link: url_helpers.question_path(ques.id), title: ques.title)
    when :up_vote
      ques = obj_up_vote
      I18n.t("user.show.action.upvote", name: name, link: url_helpers.question_path(ques.id), title: ques.title)
    when :share_fa

    when :share_tw

    when :follow
      target = obj_follow
      I18n.t("user.show.action.follow", name: name, link: target[:link], title: target[:name])
    else
      "We don't have info"
    end
  end

end
