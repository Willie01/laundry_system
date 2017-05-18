json.extract! couponrule_city, :id, :city_id, :start_on, :end_on, :status, :created_at, :updated_at, :city_name 
json.created_at(couponrule_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(couponrule_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url couponrule_city_url(couponrule_city, format: :json)
