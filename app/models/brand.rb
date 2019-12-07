class Brand < ApplicationRecord
    has_many :cookies
    validates :name, presence: true, uniqueness: true
 

    def self.alpha
        order(:name)
    end
       
    
end
