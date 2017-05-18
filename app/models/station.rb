class Station < ApplicationRecord
	belongs_to :factory
	has_many :couriers
end
