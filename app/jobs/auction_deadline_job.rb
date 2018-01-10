class AuctionDeadlineJob < ApplicationJob
  queue_as :default

  def perform(x, order)
    auction_id = order.auctions.last.id
    order.client.notifications.create!(body:"Your auction has been ended", auction_id:auction_id)
    if x.bids.exists?
      x.update_attributes!(status:"pending_acceptance")
    else
      x.update_attributes!(status:"outdated")
    end
    id = order.client.id
    z = Client.find(id).notifications.last
    ActionCable.server.broadcast "notifications:#{id}", {notification: z}
  end
end
