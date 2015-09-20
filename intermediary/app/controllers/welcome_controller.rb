require 'open-uri'
class WelcomeController < ApplicationController
	def index
		token = "86fca517b23dea388df2219948baa0ab"
		@products = JSON.parse(RestClient.get("http://localhost:3000/products/index.json", {:Authorization => 'Token 86fca517b23dea388df2219948baa0ab' }))
	end
end