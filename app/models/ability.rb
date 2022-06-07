# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.role?("super_admin")
      can :access, :rails_admin 
      can :read, :dashboard  
      can :manage, :all
      cannot :member, User
    elsif user.role?("admin")
      can :admin, User
      cannot :member, User
    elsif user.role?("member")
      can :member, User
    end
  end
end
