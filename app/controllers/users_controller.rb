class UsersController < ApplicationController
  def new #def name of path. defines method called by the path users/new
  	@user = User.new
  	#render text:"Hello World"
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user #redirect_to user_url(@user)
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end



private 
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation) 	#only allow injection to these fields
	end

end