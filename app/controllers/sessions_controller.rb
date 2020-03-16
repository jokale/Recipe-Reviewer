class SessionsController < ApplicationController 

    def welcome 
    end 

    def new 

    end 

   
        

        
           def create
           
            if params[:provider] == 'github'
              @user = User.create_by_github_omniauth(auth)
              session[:user_id] = @user.id	      
              redirect_to user_path(@user)	      
            elsif	    
  
         @user = User.find_by(username: params[:user][:username])
          @user.try(:authenticate, params[:user][:password])
           session[:user_id] = @user.id
              redirect_to user_path(@user)
         else 
             flash[:error] = "Sorry that was incorrect, please try again"
               redirect_to login_path
  
         end
    end 

    
    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 


    private
 
  def auth
    request.env['omniauth.auth']
  end

end 