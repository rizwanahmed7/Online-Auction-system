# frozen_string_literal: true


class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return unless user.admin?
 
 
      scope.where.not(id: @user.id)
    end
  end
 
 
  def edit?
    @user.admin?
  end
 
 
  def update?
    @user.admin?
  end
 
 
  def destroy?
    @user.admin?
  end
 end
 