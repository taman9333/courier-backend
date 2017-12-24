class Address < ApplicationRecord
	has_many :orders
	belongs_to :client
	validates :street, :area, :saved, :apartment_number, :building_number, presence: true 
end
