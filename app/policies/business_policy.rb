class BusinessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  attr_reader :user, :business

  def initialize(user, business)
    @user = user
    @business = business
  end

  def update?
    (business.user == user) || (user.has_role? :admin)
  end

  def destroy?
    (business.user == user) || (user.has_role? :admin)
  end


end