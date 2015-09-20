class ProductsController < ApplicationController
	respond_to :json, :xml
	before_action :restrict_access

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

	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
			ApiKey.exists?(secret_token: token)
		end
	end

end
