# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from StandardError, with: :catch_exception
  rescue_from Pundit::NotAuthorizedError, with: :not_authorize
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def not_authorize
    redirect_to root_path, notice: I18n.t('failure.notauthorize')
  end

  def catch_exception(excetption)
    redirect_back fallback_location: root_path, notice: excetption.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
  end
end
