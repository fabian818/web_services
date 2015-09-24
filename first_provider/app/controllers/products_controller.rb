class ProductsController < ApplicationController
	respond_to :json, :xml

	def index
		@products = Product.order(:price)
		respond_with(@products)
	end

	def show

	end

	def new

	end

	def edit

	end

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(secret_token: token)
		end
	end

end
