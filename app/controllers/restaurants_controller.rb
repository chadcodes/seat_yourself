class RestaurantsController < ApplicationController

  def index

  	@restaurants = Restaurant.all
  	# will use a filter based on popularity or occupancy afterwards
  	@most_recent_five = Restaurant.most_recent_five

    if params[:search]
      @restaurants = Restaurant.search(params[:search])
    else
      @restaurants = Restaurant.all
    end

  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
  	params.require(:restaurant).permit(:restaurant_name, :menu, :seats, :street_address, :postal_code, :photo_url)
  end
  
end
