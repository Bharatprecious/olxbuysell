class Product < ApplicationRecord
    has_many :users
    has_many :rooms
    belongs_to :category
    has_one_attached :image
end
