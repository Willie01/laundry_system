class City < ApplicationRecord
	has_many :factories
	has_many :users
	has_many :categories_cities
end
