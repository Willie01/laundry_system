json.extract! items_product, :id, :product_id, :order_item_id, :logistics_id, :item_price, :created_at, :updated_at, :product_name, :order_id, :logistics_name
json.created_at(items_product.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(items_product.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url items_product_url(items_product, format: :json)
