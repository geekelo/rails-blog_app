# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :photo, :bio, :email, :posts_counter, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :posts_counter, :email, :password, :current_password)
    end
end
