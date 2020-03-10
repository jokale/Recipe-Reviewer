class Recipe < ApplicationRecord
    belongs_to :diet 
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :reviews
    # has_many :reviews, through: :users

    accepts_nested_attributes_for :diet

validates :title, presence: true 

def self.by_diet(diet_id)
    where(diet: diet_id)
  end

end
