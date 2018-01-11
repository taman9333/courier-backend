class Auction < ApplicationRecord

	has_many :bids
	belongs_to :order
	validates :bid_deadline, :status, presence: true

	has_many :notifications
	searchkick
	after_commit :reindex_product

  def reindex_product
    Auction.reindex
  end

	scope :search_import, ->{where(status:"closed").includes(:order)}

	def search_data
		{
			pickup:order.pickup_address.area,
			category:order.category,
			weight:order.weight
		}
	end



