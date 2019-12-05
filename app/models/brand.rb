class Brand < ApplicationRecord
    has_many :cookies
    validates :name, presence: true, uniqueness: true
end
