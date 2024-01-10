# frozen_string_literal: true

class AuctionPolicy < ApplicationPolicy
  def new?
    @user.admin? || @user.seller?
  end

  def create?
    new?
  end

  def edit?
    @user.admin?
  end

  def update?
    @user.admin?
  end
end
