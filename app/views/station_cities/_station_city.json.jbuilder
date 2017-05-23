json.extract! station_city, :id, :city_id, :longitude, :latitude, :status, :created_at, :updated_at,:station_id, :city_name,:station_name
json.created_at(station_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(station_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url station_city_url(station_city, format: :json)
