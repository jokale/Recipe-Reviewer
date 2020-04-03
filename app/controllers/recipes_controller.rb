class RecipesController < ApplicationController

  def new 
        @recipe = Recipe.new 
        @recipe.build_diet
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



     def index 
      @diets = Diet.all 
         if !params[:diet].blank?
        @recipes = Recipe.by_diet(params[:diet])
         else
          @recipes = Recipe.all
         end 
      end

    def show 
        @recipe = Recipe.find(params[:id])
    end


    def edit
    end
  

    def top_rated
      @diets = Diet.all 
      if !params[:diet].blank?
       @recipes = Recipe.by_diet(params[:diet]).top_rated
      else 
       @recipes = Recipe.top_rated

      end
      render :index   
    end 

    private 

  def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id, diet_attributes: [:category])
  end 
  



end
