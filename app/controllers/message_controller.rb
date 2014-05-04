# -*- coding: utf-8 -*-
class MessageController < ApplicationController
  def index
    @messages = Message.all
  end

  def add
    @users  = User.all
    @messages = Message.new
  end

  def create
    unless params[:page].nil?
      params[:page].each do |key, value|
        @new_message = Message.new
        @user = User.where(id: key).first
        @new_message.user_id  = @user.id
        if params[:message].fetch('subject').present?
          @new_message.subject  = params[:message].fetch('subject')
        else
          @new_message.subject  = '件名なし'
        end
        @new_message.contents = params[:message].fetch('comtent')
        @new_message.read_flag = false
        @new_message.from = '管理者'
        @result = @new_message.save
      end
      redirect_to message_path, notice: 'メッセージを送信しました' and return
    end
    redirect_to message_add_path, alert: 'チェックボックスでメッセージを送るユーザを選択してください' and return
  end

  def show
    @message = Message.find(params[:id])
    @edit_message = Message.where(id: params[:id]).first
    @edit_message.read_flag = true
    @result = @edit_message.save
    # redirect_to message_path and return unless @result
  end
end
