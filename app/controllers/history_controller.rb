class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.where(id: params[:id]).first
  end

  def lend_add
    @items = Item.all
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

  def lend_create
#    STDERR.puts params.inspect

    @item = params[:item]
    @item.each do|key, value|
      item = Item.where(id: key.to_i).first
      @history = History.new(user_id: 1, item_id: key.to_i, status: 0, amount: value.to_i, failure_detail: "hoge", detail_id: 0)
      @result = @history.save
      redirect_to action: :lend_add and return if @result.blank?      
    end      

    redirect_to :controller => 'user', :action => 'mainpage', :id => 1 and return if @result
    redirect_to action: :lend_add
    
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
