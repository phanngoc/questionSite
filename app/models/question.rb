class Question < ApplicationRecord

  include PublicActivity::Model

  has_many :question_topics, dependent: :destroy
  has_many :topics, through: :question_topics

  accepts_nested_attributes_for :topics

  has_many :version_questions, foreign_key: "question_target"

  has_many :actions, as: :actionable, dependent: :destroy
  has_many :follows, as: :followable

  has_many :answers, foreign_key: "reply_to", dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true, length: {maximum: Settings.question[:content_max]}

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user

  has_many :comments, as: :commentable

  scope :lastday, ->{where updated_at: 1.day.ago..Time.now}

  scope :new_feed_nologin,  -> {
    find_by_sql("select count(distinct an.id) from answers an
      inner join questions qu on qu.id = an.reply_to
      inner join question_topics qt on qt.question_id = qu.id
      and qt.topic_id=#{topic_id}").count
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
      from questions q order by q.updated_at desc, is_follow desc, number_answer desc, q.up_vote desc";
    per_page = Settings.home.per_page;            
    @questions =  Question.includes([:topics, :user, :actions])
      .paginate_by_sql(sql, page: page, per_page: per_page)
    return @questions
  end

  def isProtected
    havePro = Question.joins(:actions)
      .where(actions: {actionable_id: self.id, type_act: Action.type_acts[:protect]})
    havePro.length != 0
  end
  
  def dataProtected
    havePro = Question.joins(actions: :user)
      .where(actions: {actionable_id: self.id, type_act: Action.type_acts[:protect]}).first
    if havePro
      havePro.actions.first
    else
      nil
    end
  end
  
  def self.find_muti id
    question = Question.find_by slug: id
    unless question
      question = Question.find_by id: id
      if question
        return Question.wrap_content(question)
      else
        return false
      end   
    else
      return Question.wrap_content(question)
    end
  end

  def self.wrap_content question
    verque = Verque.find_newest question.id
    if verque
      question.title = verque.title
      question.content = verque.content
    end
    question
  end
end
