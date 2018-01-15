json.array!(@auctions) do |auction|
  json.category auction.order.category
  json.bid_deadline auction.bid_deadline
  json.id auction.id
  json.area auction.order.pickup_address.area
  json.weight auction.order.weight
end
