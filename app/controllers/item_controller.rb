class ItemController < ApplicationController
  def index
    @items = Item.all
  end

  def add
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :trashed, :picture_path))
    @result = @item.save
    redirect_to item_path and return if @result
    render 'add' and return
  end

  def show
    @item = Item.find(params[:id])
  end
end
