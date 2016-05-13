class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  helper_method :current_user

  private

  def authenticate
    redirect_to login_path unless session[:user_id]
  end
end
