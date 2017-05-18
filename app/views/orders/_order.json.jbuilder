json.extract! order, :id, :user_id, :status, :item_num, :total_price, :address, :finished_date, :created_at, :updated_at, :appointment_time, :order_number, :courier_id, :city_id, :order_name, :logistics_id,:pay_status_id, :username, :courier_name, :city_name, :logistics_name, :pay_status_name
json.created_at(order.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(order.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.appointment_time(order.appointment_time.strftime('%Y-%m-%d %H:%M:%S'))
json.url order_url(order, format: :json)
