class Recipe < ApplicationRecord
    has_many :users
    has_one :meal 
end
