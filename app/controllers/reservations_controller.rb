class ReservationsController < ApplicationController
  def index
  	@reservations = Reservation.all
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end


  def reservation_params
  	params.require(:reservation).permit(:date, :guests, :time_slot,:user_id,:restaurant_id)
  end
end
