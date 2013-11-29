class ItemController < ApplicationController
  def index
    @items = Item.all
  end

  def add
    @item = Item.new
  end
end
