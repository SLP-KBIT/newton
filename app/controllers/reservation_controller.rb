class ReservationController < ApplicationController
  def index
    @reservehistories = ReserveHistory.all
  end

  def show
    @reservehistory = ReserveHistory.where(id: params[:id]).first
  end
end
