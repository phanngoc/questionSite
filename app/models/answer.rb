class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy

  has_many :actions, as: :targetable
  has_many :comments, as: :targetable
  belongs_to :user
end
