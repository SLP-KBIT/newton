class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= find_user_from_session
  end
  helper_method :current_user

  def permitted_user?
    user = User.where(id: current_user).first
    user.admin_flag
  end
  helper_method :permitted_user?

  private

  def find_user_from_session
    User.id_is(session[:user_id]).first if session[:user_id]
  end
end
