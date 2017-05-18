json.extract! coupons_user, :id, :user_id, :coupon_status_id, :created_at, :updated_at, :coupon_coupontype_id, :couponrule_id, :coupon_id, :coupon_type_id, :username, :coupon_status_name, :price, :coupon_name, :start_on, :end_on, :coupon_type_name
json.created_at(coupons_user.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(coupons_user.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url coupons_user_url(coupons_user, format: :json)
