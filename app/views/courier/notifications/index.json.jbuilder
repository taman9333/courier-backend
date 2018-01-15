json.array!(@notifications) do |notification|
  json.body notification.body
  # json.order_id notification.auction.order.id
  if notification.body.include?"won"
    json.delivery_id notification.auction.order.delivery.id
  else
    json.order_id notification.auction.order.id
  end
  json.check notification.check
  json.id notification.id
end
