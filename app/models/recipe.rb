class Recipe < ApplicationRecord
    belongs_to :diet 
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :review

    accepts_nested_attributes_for :diet


private 

def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :cooking_instruction, :diet_id, :diet_attributes[:category])
end 

end
