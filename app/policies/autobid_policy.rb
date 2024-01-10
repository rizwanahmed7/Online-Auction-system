# frozen_string_literal: true

class AutobidPolicy < ApplicationPolicy
  def new?
    @user.buyer?
  end

  def create?
    new?
  end
end
