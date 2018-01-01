class AuctionDeadlineJob < ApplicationJob
  queue_as :default

  def perform(x)
    if x.bids.exists?
      x.update_attributes(status:"pending_acceptance")
    else
      x.update_attributes(status:"outdated")
    end
  end
end
