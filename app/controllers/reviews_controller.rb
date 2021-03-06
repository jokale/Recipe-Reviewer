class ReviewsController < ApplicationController
   

def new
     if @recipe = Recipe.find_by_id(params[:recipe_id])
       @review = @recipe.reviews.build 
     else 
    @review = Review.new 
     end 
end 


def create
    @review = current_user.reviews.build(review_params) 
    if @review.save 
    redirect_to review_path(@review)
    else 
        render :new
    end  
end 


def show 
    @review = Review.find_by_id(params[:id])
    
end

def index 
   if @recipe = Recipe.find_by_id(params[:recipe_id])
    @reviews = @recipe.reviews 
   else  
    @reviews = Review.all 
   end 
end 

private 

def review_params 

    params.require(:review).permit(:recipe_id, :title, :overview, :rating, :user_id)
end 

end
