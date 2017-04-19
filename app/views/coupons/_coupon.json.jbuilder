json.extract! coupon, :id, :user_id, :price, :deadline, :coupon_type, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
