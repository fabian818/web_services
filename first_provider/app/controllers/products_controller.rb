class ProductsController < ApplicationController
	respond_to :json, :xml

	def index
		@products = Product.select(:name, :id)
		respond_with(@products)
	end

	def show

	end

	def new

	end

	def edit

	end

	def verify_token
		authheñkasdñfkjasdñflñsdf()
	end

end
