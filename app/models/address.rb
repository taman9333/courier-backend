class Address < ApplicationRecord

	has_many :pickups , class_name: "Orders", foreign_key: :pickup_address
	has_many :drop_offs , class_name: "Orders", foreign_key: :drop_off_address
	belongs_to :client
	validates :street, :area, :apartment_number, :building_number, presence: true 


end
