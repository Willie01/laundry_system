json.extract! coupon_type, :id, :coupon_type_name, :created_at, :updated_at
json.created_at(coupon_type.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupon_type.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupon_type_url(coupon_type, format: :json)
