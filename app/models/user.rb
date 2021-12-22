class User < ApplicationRecord
	before_save { self.email = email.downcase }
	has_many :articles
	VALID_EMAIL_REGEX = /\A(\w*)(@)(\w*)(\.\w{2,4})\z/i
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :username, length: { within: 3..25 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :email, length: { maximum: 105 }
	validates :email, format: { with: VALID_EMAIL_REGEX }
	has_secure_password
end
