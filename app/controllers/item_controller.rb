# -*- coding: utf-8 -*-
class ItemController < ApplicationController
  before_action :permittion_check, only: [:add, :create, :edit, :update]

  def index
    @items = Item.all
    # @items = Item.where(trashed: false)
  end

  def add
    @item = Item.new
  end

  def create
    @item = Item.new(params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :image))
    @item.trashed = false
    @result = @item.save
    redirect_to item_path and return if @result
    render 'add' and return
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    redirect_to history_lend_add_path, page: :params[:page] and return if params[:commit] == '借りる'
    @item = Item.where(id: params[:item][:id]).first
    @item.attributes = params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :trashed, :image)
    @result = @item.save
    redirect_to item_path and return if @result
    render 'edit' and return
  end

  def edit
    @item = Item.find(params[:id])
  end
end
