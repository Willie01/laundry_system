json.extract! pay_status, :id, :pay_status_name, :created_at, :updated_at
json.created_at(pay_status.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(pay_status.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url pay_status_url(pay_status, format: :json)
