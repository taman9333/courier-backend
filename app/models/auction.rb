class Auction < ApplicationRecord
	
	include Filterable
	
	has_many :bids
	belongs_to :order
	
	validates :bid_deadline, :status, presence: true 
end
