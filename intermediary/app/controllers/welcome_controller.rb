require 'open-uri'
class WelcomeController < ApplicationController
	def index
		providers = Provider.all
		@products = Array.new
		providers.each do |provider|
			@products += JSON.parse(RestClient.get(provider.url, {:Authorization => "Token #{provider.token}" }))['products']
		end
	end
end