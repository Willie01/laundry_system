class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  delegate :station, :to => :order
end
