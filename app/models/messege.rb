class Messege < ApplicationRecord
    belongs_to :room
    broadcasts_to ->(room) { :messege_list}
end
