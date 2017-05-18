json.extract! price_rule, :id, :price, :price_type_id, :products_id, :city_id, :created_at, :updated_at, :price_type_name, :product_name, :city_name
json.created_at(price_rule.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(price_rule.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url price_rule_url(price_rule, format: :json)
