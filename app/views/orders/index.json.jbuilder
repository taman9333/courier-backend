json.array!(@orders) do |order|
  json.category order.category
  json.delivery_date order.delivery_date
  json.id order.id
end
