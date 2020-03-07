class RecipesController < ApplicationController

    def new 
        @recipe = Recipe.new 
        @recipe.build_diet
    end 

    def create 
        # @recipe = Recipe.new(recipe_params)
        # @recipe.user_id = session[:user_id]
        # if @recipe.save
        
        #      redirect_to recipe_path(@recipe)
        # else 
        #     render :new 
        # end
    end 

    def index 
    end 

    
    private 

#  def recipe_params
#      params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id :diet_attributes[:category])

# #     # getting no implicit conversion of Symbol into Integer error 
#  end 



end
