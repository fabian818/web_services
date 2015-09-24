require 'open-uri'
class WelcomeController < ApplicationController
	def index
		actions = MyAction.where(name: 'index')
		@products = []
		@products_unite = []
		actions.each do |action|
			@products_unite = JSON.parse(RestClient.get(action.url, { :Authorization => "Token #{action.provider.token}" }))['products']
			@products_unite.each { |p| p['enterprise'] = action.provider.name }
			@products += @products_unite
		end
	end

	def search
		actions = MyAction.where(name: 'search')
		@products = []
		@products_unite = []
		actions.each do |action|

			# render text: action.url
			@products_unite = JSON.parse(RestClient.get(action.url + '?name=' + params[:name], { :Authorization => "Token #{action.provider.token}" }))['products']
			@products_unite.each { |p| p['enterprise'] = action.provider.name }
			@products += @products_unite
			@products = @products.sort_by { |product| product['price'] }
		end
	end
end