json.extract! order, :id, :user_id, :status, :item_num, :totol_price, :address, :finished_date, :created_at, :updated_at, :appointment_time, :order_number, :courier_id, :factory_id, :city_id, :name
json.url order_url(order, format: :json)
