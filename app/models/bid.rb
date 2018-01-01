class Bid < ApplicationRecord
  validates :price, presence: true
  belongs_to :courier
  belongs_to :auction

  validate :check_open_and_price


  def check_open_and_price
    if self.auction.status != "open"
      errors.add(:base, "Auction has been closed, you can't add a bid")
      return
    end
    x = Bid.minimum(:price).to_f
    if self.price > x
      errors.add(:base, "You can't enter a higher price.")
    end
  end

end
