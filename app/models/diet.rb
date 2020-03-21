class Diet < ApplicationRecord 
     has_many :recipes 
  
    
    validates :category, uniqueness: :true 

    scope :asc_order, -> {order(category: :asc)}
end
