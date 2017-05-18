json.extract! courier_city, :id, :courier_id, :longitude, :latitude, :city_id, :status, :created_at, :updated_at, :city_name, :courier_name
json.created_at(courier_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(courier_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url courier_city_url(courier_city, format: :json)
