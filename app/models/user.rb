
class User < ApplicationRecord
    has_many :reviews 
    has_many :recipes
    # has_many :reviews, through: :recipes 
    

    validates :username, presence: true
    validates :email, presence: true, uniqueness:true
    
    has_secure_password

  

    def self.create_by_google_omniauth(auth)
      self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
      end
    end
    
   



end
