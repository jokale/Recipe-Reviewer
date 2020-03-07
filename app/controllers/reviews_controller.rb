class ReviewsController < ApplicationController

def new
    @review = Review.new 
    @recipe = Recipe.find_by_id(params[:id])
    #  @review = @recipe.review.build
    # page loads when that line of code is commented out
    # undefined method `build' for nil:NilClass
end 
  

def create
    @review = Review.new(review_params)
    if @review.save 
    redirect_to review_path(@review)
    else 
        render :new
    end  
end 

#review does not seem to be saving 

def show 
    @review = Review.find_by_id(params[:id])
    
end

def index 
end 

private 

def review_params 

    params.require(:review).permit(:recipe_id, :title, :overview, :rating)
end 

end
