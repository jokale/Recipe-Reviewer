class Diet < ApplicationRecord
    
     belongs_to :recipe 
    # has_many :recipes 
    # has_many :users, through: :recipes
    # has_many :recipes, through: :users
    
    validates :category, uniqueness: :true 

    scope :asc_order, -> {order(category: :asc)}
end
