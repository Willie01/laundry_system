json.extract! user_address, :id, :user_id, :address, :telphone, :default_address, :created_at, :updated_at, :username
json.created_at(user_address.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(user_address.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url user_address_url(user_address, format: :json)
