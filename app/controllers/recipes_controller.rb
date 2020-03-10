class RecipesController < ApplicationController
    helper_method :params
  def new 
        @recipe = Recipe.new 
        @recipe.build_diet
    end 
        def create 
          @recipe = Recipe.new(recipe_params)
        #  even if I use create or new the recipe still is not saving 
            @recipe.user_id = session[:user_id]
         if @recipe.save
        
              redirect_to recipe_path(@recipe),notice: "Successfully created"
           
           else 
            @recipe.build_diet 
             render :new  
        end
     end



    def index 
        @diets = Diet.all 
        if !params[:diet].blank?
            @recipe = Recipe.by_diet(params[:diet])
        #   elsif !params[:date].blank?
          else
           
            @recipes = Recipe.all
          end 
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end

  
        # create is not working it seems 

 


    private 

  def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id, diet_attributes: [:category])
end 
# #     # getting no implicit conversion of Symbol into Integer error 
  



end
