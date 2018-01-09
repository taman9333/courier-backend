class Auction < ApplicationRecord
	
	has_many :bids
	belongs_to :order
	
	validates :bid_deadline, :status, presence: true 

	searchkick
	after_commit :reindex_auction
	scope :search_import, -> { where(status: "open").includes(:order)}

	def search_data 
		# as_json only: [:category]
		{
		category: order.category,
		weight: order.weight,
		pickup_area: order.pickup_address.area,
		drop_off_area: order.drop_off_address.area
		}
	end

	def reindex_auction
	  Auction.reindex
	end

end
