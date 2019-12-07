class Review < ApplicationRecord
  belongs_to :user
  belongs_to :cookie

  validates :title, presence: true 
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :cookie, uniqueness: {scope: :user, message: "Monster: 'Me thinks you've tried cookie before! Om Nom Nom Nom!'"}
end
