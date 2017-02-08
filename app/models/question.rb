class Question < ApplicationRecord
  has_many :question_topics
  has_many :topics, through: :question_topics

  accepts_nested_attributes_for :topics

  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :actionable
  has_many :follows, as: :followable

  has_many :answers, foreign_key: "reply_to"

  validates :title, presence: true
  validates :content, length: { maximum: 255 }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user

  has_many :comments, as: :commentable

  scope :new_feed_nologin,  -> {
    find_by_sql("select count(distinct an.id) from answers an
                  inner join questions qu on qu.id = an.reply_to
                  inner join question_topics qt on qt.question_id = qu.id
                  and qt.topic_id=#{topic_id}").count
  }

  scope :new_feed_login, -> user_id {
    find_by_sql("select q.*, IF(EXISTS(
            				select * from actions a where a.user_id = #{user_id}
            				and a.type_act = #{Action.type_acts[:follow]} and a.actionable_type = 'Topic'
            				and a.actionable_id in (
            					select qt.topic_id from question_topics qt where qt.question_id = q.id
            				)
            			),1,0) AS is_follow, (select count(an.id) from answers an
                  where an.reply_to = q.id) as number_answer
            			from questions q order by q.updated_at desc, is_follow desc, number_answer desc, q.up_vote desc
                ")
  }

  scope :with_user, -> {
    includes(:user)
  }

  scope :with_topics, -> {
    includes(:topics).joins(:actions)
  }

  def self.new_feed_login(user_id, page)
    sql = "select q.*, IF(EXISTS(
            				select * from actions a where a.user_id = #{user_id}
            				and a.type_act = #{Action.type_acts[:follow]} and a.actionable_type = 'Topic'
            				and a.actionable_id in (
            					select qt.topic_id from question_topics qt where qt.question_id = q.id
            				)
            			),1,0) AS is_follow, (select count(an.id) from answers an
                  where an.reply_to = q.id) as number_answer
            			from questions q order by q.updated_at desc, is_follow desc, number_answer desc, q.up_vote desc
                ";
    per_page = 1;            
    @questions =  Question.includes([:topics, :user, :actions]).paginate_by_sql(sql, :page => page, :per_page => per_page)
    return @questions
  end

end
