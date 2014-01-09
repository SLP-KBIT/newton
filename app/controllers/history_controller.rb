class HistoryController < ApplicationController
  def index
    @histories = History.all
  end

  def show
    @history = History.where(id: params[:id]).first
  end
end
