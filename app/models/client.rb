class Client < ApplicationRecord
  has_secure_password

  # attr_reader :password
  # attr_accessor :password_confirmation

  has_many :addresses
  # , dependent: :destroy
  has_many :orders
  # , dependent: :destroy
  has_many :notifications, as: :user


  validates :username, :email, :phone, presence: true
  #validates :username, :email, :phone, :password, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  # validates :password, confirmation: true
  # lssa na2s el regular expression bta3 el Email w el Password



end
