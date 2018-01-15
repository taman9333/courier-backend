class AddAuctionToNotification < ActiveRecord::Migration[5.1]
  def change
    add_reference :notifications, :auction, index: true
  end
end
