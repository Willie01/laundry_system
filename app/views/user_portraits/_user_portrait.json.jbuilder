json.extract! user_portrait, :id, :user_id, :portrait_id, :status, :created_at, :updated_at, :username
json.created_at(user_portrait.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(user_portrait.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url user_portrait_url(user_portrait, format: :json)
