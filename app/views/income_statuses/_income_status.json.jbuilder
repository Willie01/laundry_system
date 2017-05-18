json.extract! income_status, :id, :income_status_name, :created_at, :updated_at
json.created_at(income_status.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(income_status.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url income_status_url(income_status, format: :json)
