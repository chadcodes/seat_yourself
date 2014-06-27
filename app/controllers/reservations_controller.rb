class ReservationsController < ApplicationController
  before_filter :ensure_logged_in

  def index
  	@reservation = Reservation.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
  	@reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @reservation.user_id != current_user.id
      redirect_to restaurants_path, alert: 'This is not your reservation'
    end
  end

  def edit
    # not sure we need an edit page here.
    @reservation = Reservation.find(params[:id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to restaurants_path, notice: 'Your reservation was canceled.'
    else
      flash.now[:alert] = 'Something bad happened.  Your reservation still exists.'
      render "show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @reservation.save
      redirect_to restaurant_reservation_path, notice: 'Your reservation was made.'
    else
      flash.now[:alert] = 'Something bad happened.  Your reservation still exists.'
      render :new
    end
  end

  private
    def reservation_params
    	params.require(:reservation).permit(
        :date,
        :guests,
        :date,
        :restaurant_id)
    end
end
