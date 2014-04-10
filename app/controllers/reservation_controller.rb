class ReservationController < ApplicationController
  def index
    @reservehistories = ReserveHistory.all
  end

  def show
    @reservehistory = ReserveHistory.where(id: params[:id]).first
  end

  def add
    @items = Item.all
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
end
