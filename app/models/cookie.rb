class Cookie < ApplicationRecord
  belongs_to :brand
  belongs_to :user

  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it
end
