class Question < ApplicationRecord
  has_many :question_topics
  has_many :topics, through: :question_topics

  # has_and_belongs_to_many :topics
  accepts_nested_attributes_for :topics

  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :targetable
  has_many :follows, as: :followable

  validates :title, presence: true
  validates :content, length: { maximum: 255 }

end
