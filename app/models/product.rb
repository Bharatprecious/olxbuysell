class Product < ApplicationRecord
    belongs_to :user
    has_many :rooms
    belongs_to :category
    has_one_attached :image

    def self.search(search)
        if search
            category = Category.find_by(name: search)
            if category 
                self.where(category_id: category)
            else
                @product = Product.all
            end
        else
            @product = Product.all
        end
    end
end
