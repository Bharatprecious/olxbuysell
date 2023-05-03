class Product < ApplicationRecord
    has_many :users
    belongs_to :category
    has_one_attached :image
end
