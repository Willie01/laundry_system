json.extract! category, :id, :category_name, :status, :logo, :created_at, :updated_at
json.created_at(category.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(category.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url category_url(category, format: :json)
