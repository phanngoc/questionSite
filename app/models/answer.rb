class Answer < ApplicationRecord

  include PublicActivity::Model
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity",
    dependent: :destroy

  belongs_to :question, foreign_key: "reply_to"

  has_many :actions, as: :actionable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :version_answers, dependent: :destroy

  belongs_to :user

  validates :content, presence: true, length: {maximum:
    Settings.answer.max_content, minimum: Settings.answer.min_content}
  validates :user_id, presence: true
  validates :reply_to, presence: true

  scope :numberAnwserInTopic, -> topic_id do
    joins(question: :question_topics).where(question: {question_topics: {topic_id: topic_id}})
  end

  scope :with_question, -> question_id do
    includes([:user, {comments: [:actions, :user]}])
      .where reply_to: question_id
  end

  def des_upvote
    update_attributes up_vote: up_vote - 1
  end

  def des_downvote
    update_attributes down_vote: down_vote - 1
  end
end
