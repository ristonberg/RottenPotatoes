class SessionsController < ApplicationController

    
    private def session_params
        params.require(:user).permit(:user_id, :email, :timestamps)
    end
  
    def show
        id = params[:user_id] # retrieve user ID from URI route
        @user = User.find(id) # look up user by unique ID
    end
        
    def new
    end

    def create
        if @user = User.where(user_id: params[:user][:user_id])
            if @user[:email] == params[:email]
                session[:session_token]= user.session_token
                flash[:notice] = "#{@user.user_id} was successfully logged in."
                redirect_to movie_path
            else
                flash[:notice] = "invalid user-id/email combination for #{params[:user_id]}."
                redirect_to login_path
            end
        else
            flash[:notice] = "invalid user-id/email combination for #{params[:user_id]}."
            redirect_to login_path
        end
    end

    def logout
        reset_session
        redirect_to movie_path
    end
    
end