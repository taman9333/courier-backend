class AuctionDeadlineJob < ApplicationJob
  queue_as :default

  def perform(auction, order)
    auction_id = order.auctions.last.id
    z = order.client.notifications.create!(body:"Your auction has been ended", auction_id:auction_id)
    if auction.bids.exists?
      auction.update_attributes!(status:"pending_acceptance")
    else
      auction.update_attributes!(status:"outdated")
    end
    id = order.client.id
    # z = Client.find(id).notifications.last
    ActionCable.server.broadcast "notifications:#{id}", {notification: z, order_id:order.id}
  end
end
