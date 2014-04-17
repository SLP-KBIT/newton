# -*- coding: utf-8 -*-
class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.where(id: params[:id]).first
  end

  def lend_add
    @items = Item.all
    @item_ids = []
    params[:page].each_value do |value|
      @item_ids.push(value) if value.to_i > 0
    end
    redirect_to item_path, alert: '物品を選択してください' and return if @item_ids.empty?
    if params[:reserve]
      redirect_to reservation_create_path(params[:page]) and return
    end

    @items = Item.where(id: @item_ids).where('amount > 0')
    redirect_to item_path, alert: '貸出可能な物品を選択してください' and return if @items.empty?
    @array2 = []
    @items.each do |item|
      @array1 = []
      (1..item.amount).each do |i|
        @array = []
        @array.push(i)
        @array.push(i)
        @array1.push(@array)
      end
      @array2.push(@array1)
    end
  end

  def lend_confirm
    @item_ids = []
    @history_amounts = []
    params[:item].each do |key, value|
      @item_ids.push(key)
      @history_amounts.push(value)
    end
    @items = Item.where(id: @item_ids).where('amount > 0')
    @item = params[:item]
  end

  def lend_create
    # STDERR.puts params.inspect
    @item = params[:item]
    @item.each do|key, value|
      item = Item.where(id: key).first
      @history = item.histories.create(user_id: current_user.id, type: 'LendHistory', amount: value.to_i)
      @result = @history.save
      item.amount -= 1
      item.save
      redirect_to action: :lend_add and return if @result.blank?
    end

    redirect_to user_mainpage_path(current_user.id) and return if @result
    # redirect_to :controller => 'user', :action => 'mainpage', :id => 1 and return if @result
    redirect_to action: :lend_add
  end

  def return_add
    @return_histories = []
    redirect_to user_mainpage_path(current_user.id), alert: '選択してください' and return if params[:page].nil?
    params[:page].each_value do |value|
      @return_histories.push(value) if value.to_i > 0
    end
    redirect_to user_mainpage_path(current_user.id), alert: '選択してください' and return if @return_histories.empty?
    @histories = History.where(id: @return_histories)
  end

  def return_confirm
    history_ids = []
    params[:type].each_key do |key|
      history_ids.push(key)
    end
    @histories = History.where(id: history_ids)
    @type = params[:type]
    @report = params[:report]
  end

  def return_create
    params[:type].each_key do |history_id|
      lend_history = History.where(id: history_id).first
      item = Item.where(id: lend_history.item_id).first
      @history = item.histories.create(user_id: current_user.id, type: params[:type][history_id.to_s], failure_detail: params[:report][history_id.to_s], amount: lend_history.amount)
      @result = @history.save
      item.amount += 1
      item.save
      redirect_to controller: 'user', action:  'mainpage', id: current_user.id and return if @result.blank?
    end
    redirect_to controller: 'user', action:  'mainpage', id: current_user.id and return
  end
end
