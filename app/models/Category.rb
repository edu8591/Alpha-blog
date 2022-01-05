class Category < ApplicationRecord
	has_many :article_categories
	has_many :articles, through: :article_categories
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: { in: 3..20 }
end
