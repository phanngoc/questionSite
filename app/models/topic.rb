class Topic < ApplicationRecord
  has_many :questions
  has_many :questions, through: :question_topics

  has_many :actions, as: :targetable
  has_many :follows, as: :followable
end
