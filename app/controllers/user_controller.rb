class UserController < ApplicationController
  def index
    @users = User.all
  end

  def add
    @user = User.new
  end
end
