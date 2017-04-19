class Station < ApplicationRecord
	belongs_to :city
	belongs_to :factory
end
