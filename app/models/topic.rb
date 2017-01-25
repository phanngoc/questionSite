class Topic < ApplicationRecord
  has_many :questions
  has_many :questions, through: :question_topics

  has_many :actions, as: :targetable
  has_many :follows, as: :followable

  validates :name, presence: true, length: {maximum: 100}, uniqueness: {case_sensitive: false}
  validates :description, presence: true, length: {maximum: 255}
  validates :icon, presence: true

  mount_uploader :icon, IconTopicUploader

end
