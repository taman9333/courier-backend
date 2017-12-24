class Client < ApplicationRecord
  has_many :addresses
  # , dependent: :destroy
  has_many :orders
  # , dependent: :destroy
  validates :username, :email, :phone, :password, :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  # lssa na2s el regular expression bta3 el Email w el Password

end
