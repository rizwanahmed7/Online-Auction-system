# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @users = policy_scope(User)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_update_param)
      redirect_to users_path, notice: I18n.t('update.user')
    else
      redirect_to edit_user_path(@user), notice: I18n.t('notupdated.user')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: I18n.t('destroy.user')
  end

  private

  def authorize_user
    authorize User
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_update_param
    params.require(:user).permit(:role)
  end
end
