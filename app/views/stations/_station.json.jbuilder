json.extract! station, :id, :address, :phone, :created_at, :updated_at, :status, :station_name
json.created_at(station.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(station.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url station_url(station, format: :json)
