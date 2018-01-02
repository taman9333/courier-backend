class Courier < ApplicationRecord
  has_secure_password
	attr_reader :password
  attr_accessor :password_confirmation

  has_many :deliveries
  has_many :bids
  has_many :notifications, as: :user

  validates :username, :email, :phone, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, :username, uniqueness: true
end


