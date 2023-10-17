# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    # Placeholder for all post page
    @user = User.find(params[:user_id]) # Assuming you're using user_id from params
    @posts = @user.posts
  end

  def show
    # Placeholder for single post page
    @post = Post.find(params[:id])
  end
end
