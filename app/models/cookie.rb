class Cookie < ApplicationRecord
  belongs_to :brand
  belongs_to :user

  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it

  validates :flavour, presence: true
  validate :no_copycats

  def brand_attributes=(attributes)
    self.brand = Brand.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brand
  end

  def no_copycats
    cookie = Cookie.find_by(flavour: flavour, brand_id: brand_id)
    if !!cookie && cookie != self
      errors.add(:flavour, 'has already been added for that brand!')
    end
  end
end
