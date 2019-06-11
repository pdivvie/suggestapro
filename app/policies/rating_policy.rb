class RatingPolicy < ApplicationPolicy
  attr_reader :user, :rating

  def initialize(user, rating)
    @user = user
    @rating = rating
  end

  def edit?
    (rating.user == user) || (user.has_role? :admin) ||

    if user.has_role? :area_moderator
      rating.location_id + 3 == user.roles.last.id
    end

  end

  def update?
    (rating.user == user) || (user.has_role? :admin) ||

    if user.has_role? :area_moderator
      rating.location_id + 3 == user.roles.last.id
    end
  end

  def destroy?
    (rating.user == user) || (user.has_role? :admin) ||

    if user.has_role? :area_moderator
      rating.location_id + 3 == user.roles.last.id
    end
  end

  def create?
    user.business_ids.each do |i|
      if rating.business_id == i
        return false
      end
    end
  end

end