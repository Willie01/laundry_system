json.extract! courier, :id, :courier_name, :telphone, :portrait, :status, :rank, :created_at, :updated_at, :password, :id_number
json.created_at(courier.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(courier.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url courier_url(courier, format: :json)
