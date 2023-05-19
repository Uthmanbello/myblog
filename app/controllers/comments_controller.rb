# Top-level documentation comment for CommentsController module
class CommentsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post

    authorize! :destroy, @comment

    if @comment.destroy
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment deleted successfully.'
    else
      redirect_to user_post_path(params[:user_id], params[:post_id]), alert: 'Failed to delete the comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
