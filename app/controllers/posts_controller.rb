# Top-level documentation comment for PostsController module
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    @post.likes_counter += 1
    @post.save
    redirect_to user_post_path(@user, @post)
  end
  
end
