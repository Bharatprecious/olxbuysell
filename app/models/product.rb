class Product < ApplicationRecord
    belongs_to :user
    has_many :rooms
    belongs_to :category
    has_one_attached :image
end
