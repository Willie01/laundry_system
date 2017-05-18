json.extract! product, :id, :status, :logo, :created_at, :updated_at, :product_name, :description
json.created_at(product.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(product.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url product_url(product, format: :json)
