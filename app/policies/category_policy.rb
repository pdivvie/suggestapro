class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def index?
    user.has_role? :admin
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