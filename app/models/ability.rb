class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.new_record?
      can :create, Spree::Comment
    end
  end
end