class Product < ApplicationRecord

	validates :name, presence: true
	validates :price, presence: true, numericality: true

	belongs_to :user

end
