class LocationPolicy < ApplicationPolicy
  attr_reader :user, :location

  def initialize(user, location)
    @user = user
    @location = location
  end

  def edit?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :admin
  end

  def new?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end

end