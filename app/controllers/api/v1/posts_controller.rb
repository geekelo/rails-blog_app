# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts
    render json: @posts
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
