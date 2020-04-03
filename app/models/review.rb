class Review < ApplicationRecord
     belongs_to :user
     belongs_to :recipe, counter_cache: true 



    validates :title, uniqueness: :true 

    validates :rating, numericality: {only_integer: true,
greater_than_or_equal_to: 1, less_than:6 }

    validates :recipe_id, uniqueness: { scope: :user,
    message: "Sorry you can only make one review per recipe!"}

end
