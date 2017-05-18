json.extract! product_category, :id, :product_id, :category_id, :status, :created_at, :updated_at , :product_name, :category_name
json.created_at(product_category.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(product_category.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url product_category_url(product_category, format: :json)
