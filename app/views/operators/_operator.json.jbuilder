json.extract! operator, :id, :operator_name, :telphone, :status, :password, :created_at, :updated_at
json.created_at(operator.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(operator.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url operator_url(operator, format: :json)
