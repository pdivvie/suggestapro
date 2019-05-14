class RatingPolicy < ApplicationPolicy
  class Rating < Rating
    attr_reader :user, :rating

    def initialize(user, rating)
      @user = user
      @rating = rating
    end

    def update?
      (rating.user == user) || (user.has_role? :admin)
    end

    def destroy?
      (rating.user == user) || (user.has_role? :admin)
    end
  end
end