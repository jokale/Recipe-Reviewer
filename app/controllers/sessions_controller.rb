class SessionsController < ApplicationController 
helper_method :logged_in?, :current_user
     def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 
    
    def welcome 
    end 

    def new 

    end 

     def create
                @user = User.find_by(username: params[:user][:username])
                if@user.try(:authenticate, params[:user][:password])
                  session[:user_id] = @user.id
                  redirect_to user_path(@user)
                else
                  flash[:error] = "Sorry, login info was incorrect. Please try again."
                  render 'new'
                end
            end 

  def create_facebook
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = "noemailgiven@random.com"
        u.password = SecureRandom.hex 
      
      end
   
      session[:user_id] = @user.id
   
      render 'welcome'
    end

    def omniauth
      @user = User.from_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    end


   


    private
 
  def auth
    request.env['omniauth.auth']
  end


end 