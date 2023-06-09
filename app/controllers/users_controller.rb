# Top-level documentation comment for UsersController module
class UsersController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @users = User.includes(:posts).order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
