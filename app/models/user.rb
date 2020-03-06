class User < ApplicationRecord
    has_many :reviews 
    has_many :meals, through: :recipes 
    has_many :recipes 

    validates :username, presence: true, uniqueness:trueb
    has_secure_password
end
