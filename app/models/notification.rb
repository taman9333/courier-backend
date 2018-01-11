class Notification < ApplicationRecord
	belongs_to :user, polymorphic: true
	belongs_to :auction
end
