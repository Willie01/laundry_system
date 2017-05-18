json.extract! factory_city, :id, :city_id, :longitude, :latitude, :status, :created_at, :updated_at, :city_name, :factory_name
json.created_at(factory_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(factory_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url factory_city_url(factory_city, format: :json)
