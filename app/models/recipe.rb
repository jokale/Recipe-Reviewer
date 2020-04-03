class Recipe < ApplicationRecord
    belongs_to :diet 
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :reviews

    
    accepts_nested_attributes_for :diet

validates :title, presence: true 

def self.by_diet(diet_id)
    where(diet: diet_id)
  end

  def self.top_rated
    Review.group("recipe_id").average("rating").select { |k, v| v > 4 }.keys.map{|id|Recipe.find(id)} 
  end 

end
