class Courier < ApplicationRecord
  has_many :deliveries
  # , dependent: :destroy
  has_many :bids
  # , dependent: :destroy
  validates :username, :email, :password, :password_confirmation, :phone, presence: true
  validates :email, :username, uniqueness: true
end
