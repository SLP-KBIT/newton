class UserController < ApplicationController
  def index
    @users = User.all
  end

  def add
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :account, :admin_flag, :category, :lendable, :e_mail, :password))
    @result = @user.save
    redirect_to user_path and return if @result
    render 'add' and return
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.where(id: params[:user][:id]).first
    @user.attributes = params.require(:user).permit(:id, :name, :account, :admin_flag, :category, :lendable, :e_mail, :password)
    @result = @user.save
    redirect_to user_path and return if @result
    render 'edit' and return
  end
  
  def mainpage
    @item_ids = History.where(user_id: params[:id]).order(:created_at).pluck(:item_id).uniq
    @histories = History.where(user_id: params[:id])
    @lending_item_ids = Array.new
    @lending_data
    @item_ids.each do |id| 
      @history = @histories.where(item_id: id).order(:created_at).reverse_order.first
      if @history.status == 0
        @lending_item_ids.push(@history.item_id)
      end
    end
    @items = Item.where(id: @lending_item_ids)
  end
end
