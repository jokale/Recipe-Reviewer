class Recipe < ApplicationRecord
    belongs_to :diet 
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :review
    has_many :reviews, through: :users

    accepts_nested_attributes_for :diet

validates :title, presence: true 


end
