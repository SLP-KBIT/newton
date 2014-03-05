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
    @items = Item.where(id: @item_ids)
    @history = History.new
    @array2 = []
    @items.each do |item|
      @array1 = Array.new
      (1..item.amount).each do |i|
        @array = Array.new
        @array.push(i)
        @array.push(i)
        @array1.push(@array)
      end
      @array2.push(@array1)
    end
  end

  def return_add
    @return_histories = []
    params[:page].each_value do |value|
      @return_histories.push(value) if value.to_i > 0
    end
    @histories = History.where(id: @return_histories)
  end

  def return_confirm
    @history_ids = []
    params[:state].each_key do |key|
      @history_ids.push(key)
    end
    @histories = History.where(id: @history_ids)
    @status = params[:state]
    @report = params[:report]
  end
end
