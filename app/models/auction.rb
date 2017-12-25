class Auction < ApplicationRecord
	has_many :bids
	# , dependent: :destroy
	belongs_to :order
	
	validates :bid_deadline, :status, presence: true 
end
