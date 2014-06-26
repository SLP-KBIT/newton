class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :login_controller?
  before_action :current_user

  def permitted_user?
    user = User.where(id: current_user.id).first
    user.admin_flag
  end
  helper_method :permitted_user?

  def permittion_check
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
  end

  def after_sign_in_path_for(resource)
    mainpage_path(current_user.id)
  end

  private

  def login_controller?
    controller_name == 'login'
  end
end
