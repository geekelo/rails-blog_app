# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    # Placeholder for all post page
    @user = User.find(params[:user_id]) # Assuming you're using user_id from params
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 2)
  end

  def show
    # Placeholder for single post page
    @post = Post.includes(comments: :author).find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_parameters)
    @post.author_id = @user.id

    if @post.save
      flash[:notice] = 'The post is successfully submitted'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Can not save the post'
      render :new
    end
  end

  private

  def post_parameters
    params.require(:post).permit(:title, :text)
  end
end
