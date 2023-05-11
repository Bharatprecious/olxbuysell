class Product < ApplicationRecord
    belongs_to :user
    has_many :rooms
    belongs_to :category
    has_one_attached :image


                def self.search(search, price, location)
                    products = Product.all
                    if search.present?
                        category = Category.find_by(name: search)
                        if category
                            products = Product.where(category_id: category)
                        end
                    end
                    products = products.where("price <= ?", price.to_i) if price.present?
                    products = products.where("location = ?", location) if location.present?
                    products
                  end
         
end
