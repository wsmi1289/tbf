json.extract! line_item, :id, :product_id, :cart, :quantity, :belongs_to, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)