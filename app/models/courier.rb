class Courier < ApplicationRecord
  has_secure_password
	attr_reader :password
  attr_accessor :password_confirmation
  # attr_accessible :img

  has_many :deliveries
  has_many :bids
  has_many :notifications, as: :user

  mount_uploader :img, AvatarUploader

  validates :username, :email, :phone, presence: true
  validates :password, confirmation: true
  validates :email, :username, uniqueness: true
end


