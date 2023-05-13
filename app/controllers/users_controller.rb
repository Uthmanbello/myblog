# Top-level documentation comment for UsersController module
class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.order(created_at: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
