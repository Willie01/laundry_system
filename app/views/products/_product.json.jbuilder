json.extract! product, :id, :price, :category_id, :status, :logo, :created_at, :updated_at, :name, :description
json.url product_url(product, format: :json)
