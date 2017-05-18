json.extract! categories_city, :id, :category_id, :city_id, :status, :created_at, :updated_at, :city_name, :category_name
json.created_at(categories_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(categories_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url categories_city_url(categories_city, format: :json)
