json.extract! user_city, :id, :user_id, :city_id, :longitude, :latitude, :status, :created_at, :updated_at, :city_name ,:username
json.created_at(user_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(user_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url user_city_url(user_city, format: :json)
