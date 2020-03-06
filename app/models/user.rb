class User < ApplicationRecord
    has_many :reviews 
    has_many :meals, through: :recipes 
end
