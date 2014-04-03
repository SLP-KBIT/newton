# -*- coding: utf-8 -*-
class MessageController < ApplicationController
  def index
    @messages = Message.all
  end

  def add
    @messages = Message.new
  end

  def create
    @user = User.where(account: params[:message].fetch(:name)).first
    redirect_to message_path, notice: 'メッセージを送信しました' and return
  end
end
