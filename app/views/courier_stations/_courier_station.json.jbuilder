json.extract! courier_station, :id, :courier_id, :status, :created_at, :updated_at, :courier_name, :station_name
json.created_at(courier_station.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(courier_station.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url courier_station_url(courier_station, format: :json)
