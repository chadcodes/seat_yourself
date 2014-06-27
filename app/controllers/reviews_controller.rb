class ReviewsController < ApplicationController
  before_filter :load_restaurant

  def show
  	@review = Review.find(params[:id])
  	
  end


  def create
  	@review = @restaurant.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to restaurant_path(@restaurant), notice: "Thank you for your review"
 	else
 		render 'restaurants/show'
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  	redirect_to restaurants_path
  end

  

  def load_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :restaurant_id, :user_id)
  end

end
