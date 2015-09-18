class Product < ActiveRecord::Base
	belongs_to :sub_category
	belongs_to :brand
	has_one :specification

	before_create :set_columns

	def has_specification?
		!!has_specification
	end

	def set_columns
		self.stock = 100
		self.minimum_stock = 50
		self.price = 25
	end
end
