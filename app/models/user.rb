class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :follows, as: :followable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  before_save :init_role

  mount_uploader :avatar, AvatarUploader
  enum role: [:admin, :user, :moderator]

  private
  def init_role
    self.role ||= :user
  end
end
