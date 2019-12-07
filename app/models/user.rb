class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_cookies, through: :reviews, source: :cookies
  
    has_many :cookies #that they have created
  
    validates :username, uniqueness: true,  presence: true
    #validates :email, presence: true
  
    has_secure_password

  
end
