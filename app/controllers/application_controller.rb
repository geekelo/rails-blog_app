# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.first # Assuming you have a User model
  end
  helper_method :current_user # Makes this method available to views
end
