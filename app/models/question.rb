class Question < ApplicationRecord
  has_many :topics
  has_many :topics, through: :question_topics
  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :targetable
  has_many :follows, as: :followable
end
