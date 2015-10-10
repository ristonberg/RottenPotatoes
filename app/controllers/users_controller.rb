class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email, :timestamps)
  end
  
  def show
    id = params[:user_id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
  end
  
  def new
    # default: render 'new' template
  end
  
  def create
    
    if User.exists?(:user_id => params[:user_id]) 
    flash[:notice] = "That user id is already taken"
    else
    @user = User.create_user!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created with email #{@user.email}."
    redirect_to login_path
    end
  end

end