# frozen_string_literal: true

# Top-level documentation comment for ApplicationController module
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user = User.first
  end
end
