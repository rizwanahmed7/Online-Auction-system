# frozen_string_literal: true

class BidPolicy < ApplicationPolicy
  def new?
    @user.buyer?
  end

  def create?
    new?
  end
end
