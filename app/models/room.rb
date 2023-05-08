class Room < ApplicationRecord
    belongs_to :product
    has_many :messege
    broadcasts_to ->(room) { :rooms}
end
