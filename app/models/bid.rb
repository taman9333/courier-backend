class Bid < ApplicationRecord
  validates :price, presence: true
  belongs_to :courier
  belongs_to :auction
end
