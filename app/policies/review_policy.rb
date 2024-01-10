# frozen_string_literal: true

class ReviewPolicy < ApplicationPolicy
  def index?
    @user.buyer? || @user.seller?
  end

  def new?
    @user.buyer?
  end

  def create?
    new?
  end
end
