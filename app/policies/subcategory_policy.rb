class SubcategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, subcategory)
    @user = user
    @subcategory = subcategory
  end

  def index?
    true
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