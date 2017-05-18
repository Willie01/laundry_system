class Product < ApplicationRecord
	belongs_to :category
	belongs_to :price_rule
end
