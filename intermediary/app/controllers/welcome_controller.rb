class WelcomeController < ApplicationController
	def index
		@products = JSON.parse(open("http://localhost:3000/products/index.json").read)
	end
end
