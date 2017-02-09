class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :actions
  has_many :questions
  has_many :answers
  has_many :comments

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  before_save :init_role

  mount_uploader :avatar, AvatarUploader
  enum role: [:admin, :user, :moderator]

  validates :name, presence: true, length: {maximum: 255}
  validates :story, length: {maximum: 255}
  validates :email, presence: true, length: {maximum: 255}
  validates :role, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: I18n.t("flash.user.email")

  def self.is_follow_user(user_id, current_user_id)
    query = Action.where(["user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
                  current_user_id, "User", user_id, Action.type_acts[:follow]]);
    return query.length != 0
  end

  def self.number_user_follow(user_id)
    query = Action.where(["actionable_type = ? and actionable_id = ? and type_act = ?",
                          "User", user_id, Action.type_acts[:follow]]);
    return query.length
  end

  def self.is_upvote_answer(current_user_id, answer_id)
    query = Action.where(["user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
                  current_user_id, "Answer", answer_id, Action.type_acts[:up_vote]]);
    return query.length != 0
  end

  def self.is_downvote_answer(current_user_id, answer_id)
    query = Action.where(["user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
                  current_user_id, "Answer", answer_id, Action.type_acts[:down_vote]]);
    return query.length != 0
  end

  def self.is_upvote_question(current_user_id, question_id)
    query = Action.where(["user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
                  current_user_id, "Question", question_id, Action.type_acts[:up_vote]]);
    return query.length != 0
  end

  def self.is_downvote_question(current_user_id, question_id)
    query = Action.where(["user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
                  current_user_id, "Question", question_id, Action.type_acts[:down_vote]]);
    return query.length != 0
  end

  def is_admin?
    self.admin?
  end

  def is_moderator?
    self.moderator?
  end

  private

  def init_role
    self.role ||= :user
  end

end
