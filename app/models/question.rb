class Question < ApplicationRecord
  has_many :question_topics
  has_many :topics, through: :question_topics

  # has_and_belongs_to_many :topics
  accepts_nested_attributes_for :topics

  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :actionable
  has_many :follows, as: :followable

  has_many :answers, foreign_key: "reply_to"

  validates :title, presence: true
  validates :content, length: { maximum: 255 }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user

  has_many :comments, as: :commentable

  scope :new_feed_nologin,  -> {
    find_by_sql("select count(distinct an.id) from answers an
                  inner join questions qu on qu.id = an.reply_to
                  inner join question_topics qt on qt.question_id = qu.id
                  and qt.topic_id=#{topic_id}").count
  }

  scope :with_user, -> {
    includes(:user)
  }

  scope :with_topics, -> {
    includes(:topics).joins(:actions)
  }

end
