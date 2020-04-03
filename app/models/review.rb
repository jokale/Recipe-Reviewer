class Review < ApplicationRecord
     belongs_to :user
     belongs_to :recipe
    #  has_many :users, through:recipes  


    validates :title, uniqueness: :true 

    validates :rating, numericality: {only_integer: true,
greater_than_or_equal_to: 1, less_than:6 }
end
