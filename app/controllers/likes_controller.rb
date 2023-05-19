# frozen_string_literal: true

# Top-level documentation comment for LikesController module
class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new
    @like.author = current_user
    @like.post = Post.find(params[:post_id])
    if @like.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end
end
