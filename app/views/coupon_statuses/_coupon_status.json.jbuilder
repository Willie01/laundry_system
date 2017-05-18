json.extract! coupon_status, :id, :coupon_status_name, :created_at, :updated_at
json.created_at(coupon_status.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupon_status.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupon_status_url(coupon_status, format: :json)
