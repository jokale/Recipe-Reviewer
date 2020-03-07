class Recipe < ApplicationRecord
    belongs_to :brand 
    belongs_to :user 
    has_many :users
    has_one :meal 
end
