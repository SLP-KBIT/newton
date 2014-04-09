class ReservationController < ApplicationController
  def index
    @reservehistories = ReserveHistory.all
  end
end
