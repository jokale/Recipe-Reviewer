class RecipesController < ApplicationController


    def index 
    end

    def new 
        @recipe = Recipe.new 
        @recipe.build_diet
    end 

    
        # create is not working it seems 


    def show 
    end 

    

     def create 
         @recipe = Recipe.new(recipe_params)
          @recipe.user_id = session[:user_id]
        if @recipe.save
        
              redirect_to recipe_path(@recipe),notice: "Successfully created"
         else 
            @recipe.build_diet 
             render :new 
        end
    end
    private 

  def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id, diet_attributes: [:category])
end 
# #     # getting no implicit conversion of Symbol into Integer error 
  



end
