class SessionsController < ApplicationController 

    def welcome 
    end 

    def new 

    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id
             redirect_to user_path(@user)
        else 
             flash[:error] = "Sorry that was incorrect, please try again"
             redirect_to login_path
            # redirect_to '/'

            #user is somehow being saved but is not redirecting to the correct route!!!
        end 
    end 

    
    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 
end 