class ReservationController < ApplicationController
  def index
    @reservehistories = ReserveHistory.all
  end

  def show
    @reservehistory = ReserveHistory.where(id: params[:id]).first
  end

  def add
    @item_ids = []
    params.each_value do |value|
      @item_ids.push(value) if value.to_i > 0
    end
    @items = Item.where(id: @item_ids)
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

  def create
    item_params = params[:item]
    item_ids = item_params.keys
    @items = Item.where(id: item_ids)
    @array2 = []
    @items.each do |item_data|
      @array1 = []
      (1..item_data.amount).each do |i|
        @array = []
        @array.push(i)
        @array.push(i)
        @array1.push(@array)
      end
      @array2.push(@array1)
    end

    item_params.each do|key, value|
      item = Item.where(id: key).first
      @history = ReserveHistory.create(user_id: current_user.id, item_id: item.id, amount: value.to_i, start_date: params[:start_date][key])
      @result = @history.save
      render :add and return if @result.blank?
    end
    redirect_to reservation_path and return if @result
    render :add
  end
end
