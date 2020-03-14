class User < ApplicationRecord
    has_many :reviews 
    has_many :recipes
    has_many :recipes,  :foreign_key => :diet_id  
    has_many :reviews, through: :recipes 
    

    validates :username, presence: true, uniqueness:true
    validates :email, presence: true, uniqueness:true
    has_secure_password

    def self.create_with_omniauth(auth)
  
        user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
        user.email = "#{auth['uid']}@#{auth['provider']}.com"
        user.password = auth['uid']
        user.name = auth['info']['name']
        if User.exists?(user)
          user
        else
          user.save!
          user
        end
      end
end
