class Question < ApplicationRecord
  has_many :question_topics
  has_many :topics, through: :question_topics

  # has_and_belongs_to_many :topics
  accepts_nested_attributes_for :topics

  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :targetable
  has_many :follows, as: :followable

  has_many :answers, foreign_key: "reply_to"

  validates :title, presence: true
  validates :content, length: { maximum: 255 }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user

  has_many :comments, as: :targetable
end
