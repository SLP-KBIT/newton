# -*- coding: utf-8 -*-
class UserController < ApplicationController
  def index
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @users = User.all
  end

  def add
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @user = User.new
  end

  def create
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @user = User.new(params.require(:user).permit(:name, :account, :admin_flag, :category, :lendable, :e_mail, :password, :password_confirmation))
    @result = @user.save
    redirect_to user_path and return if @result
    render 'add' and return
  end

  def show
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @user = User.find(params[:id])
  end

  def edit
    if !permitted_user? && params[:id].to_i != current_user.id
      redirect_to controller: 'user', action: 'mainpage', id: current_user.id
    end
    @user = User.find(params[:id])
  end

  def exchange
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
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
    if @result
      redirect_to user_path and return if permitted_user?
      redirect_to controller: 'user', action: 'mainpage', id: current_user.id
    else
      render 'edit' and return
    end
  end

  def mainpage
    redirect_to controller: 'user', action: 'mainpage', id: current_user.id if params[:id].to_i != current_user.id
    @item_ids = History.where(user_id: params[:id]).order(:created_at).pluck(:item_id).uniq
    @histories = History.where(user_id: params[:id]).where.not('type = ?', 'ReserveHistory')
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

  def modify
    @user = User.where(id: current_user.id).first
  end
end
