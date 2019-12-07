class Brand < ApplicationRecord
    has_many :cookies
    validates :name, presence: true, uniqueness: true
    validate :no_copycats

    def self.alpha
        order(:name)
      end
       
    def no_copycats
        cookie = Cookie.find_by(flavour: name, brand_id: brand_id)
      if !!cookie && cookie != self
        errors.add(:brand, 'is already in cookie jar!')
      end
    end
end
