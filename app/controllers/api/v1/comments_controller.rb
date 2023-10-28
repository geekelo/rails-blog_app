class Api::V1::CommentsController < ApplicationController
  before_action :find_post

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @current = current_user
    @comment = @post.comments.build(text: comment_params[:text], author_id: @current.id)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
