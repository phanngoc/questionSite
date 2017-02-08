class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy, foreign_key: "reply_to"

  has_many :actions, as: :actionable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :content, presence: true, length: {maximum: 255, minimum: 6}
  validates :user_id, presence: true
  validates :reply_to, presence: true

end
