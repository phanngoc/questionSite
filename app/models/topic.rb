class Topic < ApplicationRecord
  has_many :question_topics
  has_many :questions, through: :question_topics

  has_many :actions, as: :actionable

  validates :name, presence: true, length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 255}
  validates :icon, presence: true

  mount_uploader :icon, IconTopicUploader

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  scope :numberFollow, -> topic_id do
    find_by_sql("select count(distinct user_id) from actions where actionable_id=#{topic_id}
                  and actionable_type='Topic' and type_act=#{Action.type_acts[:follow]}").count
  end

  scope :numberAnwserInTopic, -> topic_id do
    find_by_sql("select count(distinct an.id) from answers an
                  inner join questions qu on qu.id = an.reply_to
                  inner join question_topics qt on qt.question_id = qu.id
                  and qt.topic_id=#{topic_id}").count
  end

  scope :topics_login_user, -> (user_id) {
    find_by_sql("select topics.* from topics
          inner join actions ac on ac.actionable_id = topics.id and ac.actionable_type='Topic'
              and ac.type_act=#{Action.type_acts[:follow]} and ac.user_id = #{user_id}")
  }
end
