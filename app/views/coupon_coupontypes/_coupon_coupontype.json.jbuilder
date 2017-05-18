json.extract! coupon_coupontype, :id, :coupon_id, :coupon_type_id, :status, :created_at, :updated_at, :coupon_name, :coupon_type_name
json.created_at(coupon_coupontype.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupon_coupontype.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupon_coupontype_url(coupon_coupontype, format: :json)
