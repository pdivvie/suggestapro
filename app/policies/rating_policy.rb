class RatingPolicy < ApplicationPolicy
  attr_reader :user, :rating

  def initialize(user, rating)
    @user = user
    @rating = rating
  end

  def edit?
    (rating.user == user) || (user.has_role? :admin)
  end

  def update?
    (rating.user == user) || (user.has_role? :admin)
  end

  def destroy?
    (rating.user == user) || (user.has_role? :admin)
  end
end