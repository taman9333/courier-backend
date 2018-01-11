json.array!(@deliveries) do |delivery|
  json.category delivery.order.category
  json.delivery_date delivery.order.delivery_date
  json.id delivery.id
  json.courier delivery.order.auctions.find_by(status:"closed").bids.where(refused:false).last.courier.username
  json.price delivery.order.auctions.find_by(status:"closed").bids.where(refused:false).last.price
end
