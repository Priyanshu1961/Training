json.extract! order, :id, :customer_name, :item_name, :created_at, :updated_at
json.url order_url(order, format: :json)