class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :login_check, unless: :login_controller?
  before_action :current_user

  def current_user
    @current_user ||= find_user_from_session
  end
  helper_method :current_user

  def permitted_user?
    user = User.where(id: current_user.id).first
    user.admin_flag
  end
  helper_method :permitted_user?

  def login_check
    redirect_to login_path  if current_user.nil?
  end

  def permittion_check
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
  end

  private

  def find_user_from_session
    User.id_is(session[:user_id]).first if session[:user_id]
  end

  def login_controller?
    controller_name == 'login'
  end
end
