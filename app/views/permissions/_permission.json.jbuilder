json.extract! permission, :id, :permission_name, :created_at, :updated_at
json.created_at(permission.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(permission.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url permission_url(permission, format: :json)
