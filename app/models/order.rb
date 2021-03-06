class Order < ApplicationRecord

	has_many :auctions
	has_one :delivery
	belongs_to :pickup_address, class_name: "Address"
	belongs_to :drop_off_address, class_name: "Address"
	belongs_to :client

	accepts_nested_attributes_for :pickup_address
	accepts_nested_attributes_for :drop_off_address

	validates :category, :weight, :drop_off_address, :pickup_address, :dimensions, :billing_address, :delivery_date, presence: true
	

end
