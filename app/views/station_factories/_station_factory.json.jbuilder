json.extract! station_factory, :id, :station_id, :factory_id, :status, :created_at, :updated_at, :station_name, :factory_name
json.created_at(station_factory.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(station_factory.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url station_factory_url(station_factory, format: :json)
