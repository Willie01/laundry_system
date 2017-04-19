json.extract! order, :id, :user_id, :status, :item_num, :totol_price, :address, :finished_date, :created_at, :updated_at, :appointment_time
json.url order_url(order, format: :json)
