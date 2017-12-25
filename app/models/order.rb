class Order < ApplicationRecord
	has_many :auctions
	# , dependent: :destroy
	has_one :delivery
	# , dependent: :destroy
	belongs_to :pickup_address, class_name: "Address"
	belongs_to :drop_off_address, class_name: "Address"
	# belongs_to :billing_address, class_name: "Address"
	belongs_to :client

	validates :category, :weight, :dimensions, :billing_address, :delivery_date, presence: true 

end


