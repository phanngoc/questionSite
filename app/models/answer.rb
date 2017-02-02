class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy

  has_many :actions, as: :actionable
  has_many :comments, as: :commentable
  belongs_to :user
end
