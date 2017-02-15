class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  
    if user.role.nil?
      can :read, :all
      cannot [:update, :destroy, :create], [Topic, Comment, Answer]
      cannot [:update, :destroy, :create], User
    elsif user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:update, :destroy, :create], [Question, Answer, Comment]
      cannot [:update, :destroy, :create], Topic
      cannot [:update, :destroy], User do |u|
        u.id != user.id
      end
    end
  end
end
