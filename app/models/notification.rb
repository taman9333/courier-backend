class Notification < ApplicationRecord
	belongs_to :user, polymorphic: true
	has_many :auctions
end
