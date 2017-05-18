json.extract! portrait, :id, :url, :status, :created_at, :updated_at
json.created_at(portrait.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(portrait.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url portrait_url(portrait, format: :json)
