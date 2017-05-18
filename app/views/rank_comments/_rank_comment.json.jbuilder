json.extract! rank_comment, :id, :order_id, :courier_rank, :factory_rank, :comment, :created_at, :updated_at, :order_name
json.created_at(rank_comment.created_at.strftime('%Y-%m-%d %H:%M:%S'))
json.updated_at(rank_comment.updated_at.strftime('%Y-%m-%d %H:%M:%S'))
json.url rank_comment_url(rank_comment, format: :json)
