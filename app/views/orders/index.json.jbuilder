json.array!(@orders) do |order|
  json.extract! order, :name, :order_number, :order_date, :sum
  json.url order_url(order, format: :json)
end