class Answer < ApplicationRecord
  belongs_to :question

  has_many :actions, as: :targetable
end
