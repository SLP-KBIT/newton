class LoginController < ApplicationController
  def login
    user = User.where(account: params[:user][:account]).first
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      # redirect_to root_path
      redirect_to controller: 'user', action: 'mainpage', id: user.id
    else
      flash.now.alert = 'もう一度入力してください。'
      render :new
    end
  end

  def new
    session[:user_id] = nil
    session[:player_id] = nil
    @current_user = nil
  end
end
