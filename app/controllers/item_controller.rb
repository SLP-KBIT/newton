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

  def update
 
    @item = Item.where(id: params[:item][:id]).first
    @item.attributes = params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :trashed, :picture_path)
    @result = @item.save
    redirect_to item_path and return if @result
    render 'edit' and return
  end

end
