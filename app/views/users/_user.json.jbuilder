json.extract! user, :id, :telphone, :username, :password, :balance, :email, :portrait, :created_at, :updated_at
json.created_at(user.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(user.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url user_url(user, format: :json)
