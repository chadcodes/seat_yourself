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
    # The restaurant and user id is badly hacked in here.  Not sure how to get the
    # restaurant_id added to the form POST array hash.  It's part of the POST
    # params but not part of the reservation hash (which is used in the sanitize).
    rp = reservation_params
    rp[:restaurant_id] = params[:restaurant_id]
    rp[:user_id] = session[:user_id]

    # shitty hack to get the time into the date param, needs fixing
    rp[:date] << " " + params[:time]
    @reservation = Reservation.new(rp)
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: 'Your reservation was made.'
    else
      flash.now[:alert] = 'Something bad happened.'
      render :index
    end
  end

  private
    def reservation_params
    	params.require(:reservation).permit(
        :date,
        :guests)
    end
end
