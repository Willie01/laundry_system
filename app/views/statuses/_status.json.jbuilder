json.extract! status, :id, :status_name, :created_at, :updated_at
json.created_at(status.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(status.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url status_url(status, format: :json)
