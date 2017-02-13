class Answer < ApplicationRecord
  
  include PublicActivity::Model

  belongs_to :question, foreign_key: "reply_to"

  has_many :actions, as: :actionable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  validates :content, presence: true, length: {maximum: 
    Settings.answer.max_content, minimum: Settings.answer.min_content}
  validates :user_id, presence: true
  validates :reply_to, presence: true
  
end
