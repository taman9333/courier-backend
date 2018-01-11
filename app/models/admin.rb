class Admin < ApplicationRecord
	validates :name, :email, :password, :password_confirmation, presence: true 
	validates :email, uniqueness: true
	# validates :email, format:  { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, multiline: true}

	validates :password, confirmation: true
	# validates :password, format: { with: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/, multiline: true} 
	validates :password, length: { in: 6..20 }
end
