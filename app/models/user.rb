class User < ApplicationRecord
	has_many :user_addresses, dependent: :destroy
	has_many :coupons
	has_many :orders
end
