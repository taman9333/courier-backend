class Notification < ApplicationRecord
	belongs_to :user, polymorphic: true
end
