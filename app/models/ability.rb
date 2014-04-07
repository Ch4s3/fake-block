class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Block
      can :update, Block do |block|
        block.try(:user) == user || user.role?(:moderator)
      end
    end
  end
end
