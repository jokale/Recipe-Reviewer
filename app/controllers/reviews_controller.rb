class ReviewsController < ApplicationController

def new
    @review = Review.new 
    @recipe = Recipe.find_by_id(params[:id])
    #  @review = @recipe.review.build
    # page loads when that line of code is commented out
    # undefined method `build' for nil:NilClass
end 

def create
    @review = Review.create(review_params)
    redirect_to review_path(@review)
end 

def index 
end 

private 

def review_params 

    params.require(:review).permit(:recipe_id, :title, :overview, :rating)
end 

end
