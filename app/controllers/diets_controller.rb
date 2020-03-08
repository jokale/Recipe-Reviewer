class DietsController < ApplicationController

    def index
        @diets = Diet.all 
    end 

end
