class User < ApplicationRecord
	has_many :user_addresses, dependent: :destroy
end
