json.extract! user, :id, :telphone, :username, :password, :balance, :email, :portrait, :created_at, :updated_at
json.url user_url(user, format: :json)
