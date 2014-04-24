# -*- coding: utf-8 -*-
class ItemController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.where(trashed: false)
  end

  def add
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @item = Item.new
  end

  def create
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @item = Item.new(params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :image))
    @item.trashed = false
    @result = @item.save
    redirect_to item_path and return if @result
    render 'add' and return
  end

  def show
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @item = Item.find(params[:id])
  end

  def update
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    redirect_to history_lend_add_path, page: :params[:page] and return if params[:commit] == '借りる'
    @item = Item.where(id: params[:item][:id]).first
    @item.attributes = params.require(:item).permit(:name, :attachments, :lending_period, :category, :place, :amount, :trashed, :image)
    @result = @item.save
    redirect_to item_path and return if @result
    render 'edit' and return
  end

  def edit
    render file: "#{Rails.root}/public/404.html", status: 404 unless permitted_user?
    @item = Item.find(params[:id])
  end
end
