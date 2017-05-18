json.extract! city, :id, :city_name, :region_id, :created_at, :updated_at, :status
json.created_at(city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url city_url(city, format: :json)
