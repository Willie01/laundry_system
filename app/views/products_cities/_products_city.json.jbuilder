json.extract! products_city, :id, :product_id, :status, :city_id, :category_id, :created_at, :updated_at, :city_name, :product_name, :category_name,:logo, :price
json.created_at(products_city.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(products_city.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url products_city_url(products_city, format: :json)
