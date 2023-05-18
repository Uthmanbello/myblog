# frozen_string_literal: true

# Top-level documentation comment for ApplicationController module
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  protected

  def after_sign_in_path_for(_resource)
    users_path
  end
end
