class SessionsController < ApplicationController 

    def welcome 
    end 

    def new 

    end 

    # def create
        
        

        def create
            if request.env[‘omniauth.auth’]
              user = User.create_with_omniauth(request.env[‘omniauth.auth’])
              session[:user_id] = user.id    
              redirect_to user_path(user.id)
            else
              user = User.find_by_email(params[:email])
              user && user.authenticate(params[:password])
              session[:user_id] = user.id
              redirect_to user_path(user.id)
            end
          end
    #     @user = User.find_by(username: params[:user][:username])
    #     if @user.try(:authenticate, params[:user][:password])
    #         session[:user_id] = @user.id
    #          redirect_to user_path(@user)
    #     else 
    #          flash[:error] = "Sorry that was incorrect, please try again"
    #          redirect_to login_path
    #         # redirect_to '/'

    #         #user is somehow being saved but is not redirecting to the correct route!!!
    #     end 
    # end 

    
    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 
end 