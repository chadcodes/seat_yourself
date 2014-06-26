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
  		redirect_to root_url, :notice => "You have successfully created an account"
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

  	if @user.updates_attributes(user_params)
  		redirect_to user_path(@user), :notice => "You have successfully updated your account"
  	else
  		render 'edit'
  	end
  end


  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_url

  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :notes, :password, :password_confirmation)
  end
end
