class HistoryController < ApplicationController
  def index
    @histories = History.all
  end
end
