class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A(\w*)(@)(\w*)(\.\w{2,4})\z/i
	validates :username, presence: true, uniqueness: { case_sensitive: false }
	validates :username, length: { within: 3..25 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :email, length: { maximum: 105 }
	validates :email, format: { with: VALID_EMAIL_REGEX }
end
