class Recipe < ApplicationRecord
    belongs_to :diet 
    belongs_to :user 
    has_many :reviews
    has_many :users, through: :review

    accepts_nested_attributes_for :diet

validates :title, presence: true 
validates :rating, numericality: {only_integer: true,
greater_than_or_equal_to: 1, less_than:6 }

end
