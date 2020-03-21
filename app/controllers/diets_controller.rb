class DietsController < ApplicationController

    def index
        @diets = Diet.asc_order


    end 

    def new 
        @diet = Diet.new 
    end 

    def create 
        @diet = Diet.create(diet_params)
        if @diet.save 
            redirect_to diet_path(@diet),notice: "Successfully created"
        else 
            render :new 
        end 
    end 

    def show 
        @diet = Diet.find(params[:id])
    end 



    private 

    def diet_params
        params.require(:diet).permit(:category, :description)
    end 
end
