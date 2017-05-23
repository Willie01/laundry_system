json.extract! user_pay, :id, :user_id, :status, :pay, :created_at, :updated_at
json.url user_pay_url(user_pay, format: :json)
