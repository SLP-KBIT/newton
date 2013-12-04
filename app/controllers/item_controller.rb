class ItemController < ApplicationController
  def index
    @items = Item.all
  end

  def add
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end
end
