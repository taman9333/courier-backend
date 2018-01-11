json.array!(@notifications) do |notification|
  json.body notification.body
  json.order_id notification.auction.order.id
  json.check notification.check
  json.id notification.id
end
