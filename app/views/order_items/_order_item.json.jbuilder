json.extract! order_item, :id, :order_id, :product_id, :number, :created_at, :updated_at, :product_name
json.created_at(order_item.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(order_item.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url order_item_url(order_item, format: :json)
