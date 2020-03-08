class DietsController < ApplicationController

    def index
        @diet = Diet.all 
    end 

    def new 
        @diet = Diet.new 
    end 
    
    def create
    end  

    def show 
    end 
end
