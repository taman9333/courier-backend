class Delivery < ApplicationRecord
  # validates :rating, :status, presence: true
  validates :status, :order_id, :courier_id, presence: true
  

  belongs_to :courier
  belongs_to :order

  def check_order(x)
     Order.find(x).auctions.last.status == "pending_acceptance"
  end

  def check_bid(id)
    bid = Bid.find id
    return bid.refused
  end

end
