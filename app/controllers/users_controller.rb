class UsersController < ApplicationController
  def index
    # Placeholder for all users page
    @users = User.all
  end

  def show
    # Placeholder for single user page
    @user = User.find(params[:id])
  end
end
