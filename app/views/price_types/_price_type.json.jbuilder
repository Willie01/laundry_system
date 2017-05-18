json.extract! price_type, :id, :price_type_name, :created_at, :updated_at
json.created_at(price_type.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(price_type.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url price_type_url(price_type, format: :json)
