json.extract! logistic, :id, :logistics_name, :created_at, :updated_at
json.created_at(logistic.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(logistic.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url logistic_url(logistic, format: :json)
