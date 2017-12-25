class Courier < ApplicationRecord
  has_many :deliveries
  # , dependent: :destroy
  has_many :bids
  # , dependent: :destroy
  has_many :notifications, as: :user
  validates :username, :email, :phone, presence: true
  validates :email, :username, uniqueness: true
end
