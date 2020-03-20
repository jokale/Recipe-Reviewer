class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]


def new
    @user = User.new 
end 

def create
    @user = User.new(user_params)
    if @user.save 
    session[:user_id] = @user.id 
    redirect_to user_path(@user)
    else 
        render :show
    end 
end 


def index
    @users = User.all
end 
def show 
    @user = User.find_by_id(params[:id]) 
    
    
end 

def edit 
    @user = User.find_by_id(params[:id])

end 

def update
   if @user.update(user_params)
    redirect_to user_path(@user)
   end 
end 


 def destroy
    @user = User.find(params[:id])
    @user.destroy 
    session.clear
     redirect_to '/'


 end 


private 

def user_params
    params.require(:user).permit(:username,:email,:password)
end 


def set_user
    @user = User.find(params[:id])
end 

end 
