class RecipesController < ApplicationController

    def new 
        @recipe = Recipe.new 
        @recipe.build_diet
    end 

    def create 
        @recipe = Recipe.new(recipe_param)
        if @recipe.save
        
             redirect_to recipe_path(@recipe)
        else 
            render :new 
        end
    end 

end
