json.extract! factory, :id, :factory_name, :phone, :password, :address, :rank, :created_at, :updated_at, :status
json.created_at(factory.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(factory.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url factory_url(factory, format: :json)
