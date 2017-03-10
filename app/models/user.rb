class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable
  
  include PublicActivity::Model
  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", 
    dependent: :destroy
  
  has_many :actions
  has_many :questions
  has_many :answers
  has_many :comments

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  before_save :init_role
  before_validation :init_role
  
  mount_uploader :avatar, AvatarUploader
  enum role: [:admin, :user, :moderator]

  validates :name, presence: true, length: {maximum: Settings.user[:name_max]}
  validates :story, length: {maximum: Settings.user[:story_max]}
  validates :email, presence: true, length: {maximum: Settings.user[:email_max]}
  validates :role, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
    message: I18n.t("flash.user.email")

  scope :with_topic, -> topic_id do
    joins(:actions).where(actions: {actionable_type: Action.target_acts[:topic],
      type_act: Action.type_acts[:follow], actionable_id: topic_id})
  end

  class << self

    def is_follow_user(user_id, current_user_id)
      query = Action.where "user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
        current_user_id, "User", user_id, Action.type_acts[:follow];
      return query.length != 0
    end

    def number_user_follow user_id
      query = Action.where "actionable_type = ? and actionable_id = ? and type_act = ?",
        Action.target_acts[:user], user_id, Action.type_acts[:follow];
      return query.length
    end

    def is_upvote_answer(current_user_id, answer_id)
      query = Action.is_upvote_answer current_user_id, answer_id
      return query.length != 0
    end

    def is_downvote_answer(current_user_id, answer_id)
      query = Action.is_downvote_answer current_user_id, answer_id;
      return query.length != 0
    end

    def is_upvote_question(current_user_id, question_id)
      query = Action.is_upvote_question current_user_id, question_id;
      return query.length != 0
    end

    def is_downvote_question(current_user_id, question_id)
      query = Action.is_downvote_question current_user_id, question_id;
      return query.length != 0
    end
    
    def remove_upvote_question current_user_id, question_id
      query = Action.where "user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
        current_user_id, Action.target_acts[:question], question_id, Action.type_acts[:up_vote];
      query.destroy_all
    end

    def remove_downvote_question current_user_id, question_id
      query = Action.where "user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
        current_user_id, Action.target_acts[:question], question_id, Action.type_acts[:down_vote];
      query.destroy_all
    end

    def remove_upvote_answer current_user_id, answer_id
      query = Action.where "user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
        current_user_id, Action.target_acts[:answer], answer_id, Action.type_acts[:up_vote];
      query.destroy_all
    end

    def remove_downvote_answer current_user_id, answer_id
      query = Action.where "user_id = ? and actionable_type = ? and actionable_id = ? and type_act = ?",
        current_user_id, Action.target_acts[:answer], answer_id, Action.type_acts[:down_vote];
      query.destroy_all
    end

    def activity_by_user user_id
      PublicActivity::Activity.order("created_at desc")
        .where owner_id: user_id
    end

    def from_omniauth auth
      @users = where(provider: auth.provider, uid: auth.uid)
      if @users.length == 0
        @user = User.new
        @user.provider = auth.provider
        @user.uid = auth.uid
        @user.email = auth.info.email
        @user.name = auth.info.name
        @user.remote_avatar_url = auth.info.image.gsub("http://", "https://")
        @user.password = Devise.friendly_token[0, 20]
        @user.role = User.roles[:user]
        @user.save!
        @user
      else
        @users.first
      end
    end

    include Common
  end

  private

  def init_role
    self.role ||= :user
  end

end
