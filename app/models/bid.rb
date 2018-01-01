class Bid < ApplicationRecord
  validates :price, presence: true
  belongs_to :courier
  belongs_to :auction

  validate :check_price

  def check_price
    x = Bid.minimum(:price).to_f
    if self.price > x
      errors.add(:base, "You can't enter a higher price.")
    end
  end
end
