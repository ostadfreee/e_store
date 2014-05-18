json.array!(@products) do |product|
  json.extract! product, :name, :product_serial, :price, :discount, :unite
  json.url product_url(product, format: :json)
end