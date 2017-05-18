json.extract! coupon_city, :id, :coupon_id, :city_id, :status, :created_at, :updated_at, :city_name, :coupon_name
json.created_at(coupon_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupon_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupon_city_url(coupon_city, format: :json)
