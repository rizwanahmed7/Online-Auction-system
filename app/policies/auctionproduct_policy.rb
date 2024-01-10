# frozen_string_literal: true

class AuctionproductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.seller?
        scope.where(user_id: user.id)
      elsif user.admin?
        scope.all
      end
    end
  end

  def new?
    @user.seller?
  end

  def create?
    new?
  end

  def edit?
    @user.seller?
  end

  def update
    create?
  end

  def destroy?
    @user.seller? || @user.admin?
  end
end
