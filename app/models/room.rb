class Room < ApplicationRecord
    belongs_to :product
    has_many :messege, dependent: :destroy
end
