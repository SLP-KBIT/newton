class ReservationController < ApplicationController
  def index
    @reservation = Reservation.all
  end
end
