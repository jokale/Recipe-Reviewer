class ReviewsController < ApplicationController

def new
    @review = Review.new 
    @recipe = Recipe.find_by_id(params[:id])
    #  @review = @recipe.review.build
    # page loads when that line of code is commented out
    # undefined method `build' for nil:NilClass
end 

def index 
end 

end
