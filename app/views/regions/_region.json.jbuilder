json.extract! region, :id, :region_name, :parent_id, :level, :created_at, :updated_at
json.created_at(region.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(region.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url region_url(region, format: :json)
