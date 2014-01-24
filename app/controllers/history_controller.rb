class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.where(id: params[:id]).first
  end

  def lend_create
    @history = History.new(params.require(:history).permit(:item_id, :status, :amount, :created_at, :failure_detail, :detail_id))
    @result = @history.save
    redirect_to :controller => 'user', :action => 'mainpage', :id => 1 and return if @result
    #render 'lend_add' and return
    #redirect_to :action => 'mainpage', :id => 1
  end
end
