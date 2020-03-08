class Diet < ApplicationRecord
    scope :asc_order, -> {order(category: :asc)}
    belongs_to :recipe 
    belongs_to :user 
    has_many :users, through: :recipes
    has_many :recipes, through: :users
    
    validates :category, uniqueness: :true 
end
