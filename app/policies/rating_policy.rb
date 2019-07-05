class RatingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  
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
    if (user.has_role? :admin)
      return true
    elsif rating.location_id == user.location_id
      user.business_ids.each do |i|
        if (rating.business_id == i)
          return false
        end
      end
    else
      return false
    end

  end

end