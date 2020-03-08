class RecipesController < ApplicationController


    def index 
        @recipes = Recipe.all 
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new 
        @recipe.build_diet
    end 
        # create is not working it seems 

     def create 
         @recipe = Recipe.create(recipe_params)
        #  even if I use create or new the recipe still is not saving 
        #   @recipe.user_id = session[:user_id]
        if @recipe.save
        
              redirect_to recipe_path(@recipe),notice: "Successfully created"
         else 
            @recipe.build_diet 
             render :show  
        end
     end


    private 

  def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id, diet_attributes: [:category])
end 
# #     # getting no implicit conversion of Symbol into Integer error 
  



end
