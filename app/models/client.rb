class Client < ApplicationRecord
  has_many :addresses
  # , dependent: :destroy
  has_many :orders
  # , dependent: :destroy
  has_many :notifications, as: :user
  validates :username, :email, :phone, presence: true
  validates :email, :username, uniqueness: true
  # lssa na2s el regular expression bta3 el Email w el Password

end
