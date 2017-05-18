json.extract! coupon, :id, :price, :coupon_name, :status, :created_at, :updated_at
json.created_at(coupon.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupon.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupon_url(coupon, format: :json)
