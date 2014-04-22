# -*- coding: utf-8 -*-
class UserController < ApplicationController
  def index
    @users = User.all
  end

  def add
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :account, :admin_flag, :category, :lendable, :e_mail, :password, :password_confirmation))
    @result = @user.save
    redirect_to user_path and return if @result
    render 'add' and return
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def exchange
    if params[:page].nil? != true
      params[:page].each do |key, value|
        @user = User.where(id: key).first
        @lendable_state = @user.lendable
        if @lendable_state == true
          @user.attributes = { lendable: 'false' }
        elsif  @lendable_state == false
          @user.attributes = { lendable: 'true' }
        end
        @result = @user.save
      end
      redirect_to user_path, notice: 'ユーザの貸出フラグを変更しました' and return
    end
    redirect_to user_path, alert: 'チェックボックスで切り替えるユーザを選択してください' and return
  end

  def update
    @user = User.where(id: params[:user][:id]).first
    @user.attributes = params.require(:user).permit(:id, :name, :account, :admin_flag, :category, :lendable, :e_mail, :password, :password_confirmation)
    @result = @user.save
    redirect_to user_path and return if @result
    render 'edit' and return
  end

  def mainpage
    redirect_to :controller => "user", :action => "mainpage", :id => current_user.id if params[:id].to_i != current_user.id
    @item_ids = History.where(user_id: params[:id]).order(:created_at).pluck(:item_id).uniq
    @histories = History.where(user_id: params[:id]).where('type = ? or type = ?', 'LendHistory', 'ReturnHistory')
    @lending_item_ids = []
    @history_ids = []
    @item_ids.each do |id|
      @history = @histories.where(item_id: id).order(:created_at).reverse_order.first
      if @history.present? && @history.type == 'LendHistory'
        @history_ids.push(@history.id)
        @lending_item_ids.push(@history.item_id)
      end
    end
    @histories = History.where(id: @history_ids)
    @items = Item.where(id: @lending_item_ids)
  end
end
