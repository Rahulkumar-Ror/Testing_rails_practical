class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 15 }
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 8, maximum: 50 }
  belongs_to :user
end
