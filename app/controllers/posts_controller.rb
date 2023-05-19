# Top-level documentation comment for PostsController module
class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = "Couln't create post!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    comments = @post.comments
    likes = @post.likes
    comments.destroy_all
    likes.destroy_all
    authorize! :destroy, @post

    if @post.destroy
      redirect_to user_posts_path, notice: 'Post deleted successfully.'
    else
      redirect_to user_posts_path, alert: 'Failed to delete the post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
