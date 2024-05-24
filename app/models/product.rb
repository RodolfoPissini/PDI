class Product < ApplicationRecord
    validates :name, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
