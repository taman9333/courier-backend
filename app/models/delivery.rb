class Delivery < ApplicationRecord
  include Filterable
  validates :rating, :status, presence: true

  belongs_to :courier
  belongs_to :order
end
