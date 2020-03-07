class Diet < ApplicationRecord
    belongs_to :recipe 
    belongs_to :user 
    has_many :users, through: :recipes 
end