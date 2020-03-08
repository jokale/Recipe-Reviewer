class User < ApplicationRecord
    has_many :reviews 
    has_many :review, through: :recipes 
    has_many :recipes 

    validates :username, presence: true, uniqueness:true
    validates :email, presence: true, uniqueness:true
    has_secure_password
end
