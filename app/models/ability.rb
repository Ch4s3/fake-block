class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role? :administrator
      can :manage, :all
    else
      can :read, :all
      can :create, Block
      can :update, Block do |block|
        block.try(:user) == user || user.role?(:moderator)
      end
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:moderator)
      end
    end
  end
end
