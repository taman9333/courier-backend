json.array!(@deliveries) do |delivery|
  json.category delivery.order.category
  json.delivery_date delivery.order.delivery_date
  json.id delivery.id
end
