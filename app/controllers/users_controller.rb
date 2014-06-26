class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new 
  	@user = User.new
  end

  def create 
  	@user = User.find(params[:id])

  	if @user.save
  		redirect_to root_url, :notice => "You have successfully registered"
  	else
  		render 'new'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :notes, :password_digest)
  end
end
