class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      can :manage, Job, :user_id => user.id
      can :read, Job, :user_id => user.id
    end
  end
end
