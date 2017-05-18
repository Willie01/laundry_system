json.extract! operator_permission, :id, :operator_id, :permission_id, :status, :created_at, :updated_at, :operator_name, :permission_name
json.created_at(operator_permission.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(operator_permission.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url operator_permission_url(operator_permission, format: :json)
