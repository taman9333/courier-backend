class Delivery < ApplicationRecord
  validates :rating, :status, presence: true

  belongs_to :courier
  belongs_to :order
end
