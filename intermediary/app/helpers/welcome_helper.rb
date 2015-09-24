module WelcomeHelper
	def danger?(stock, minimum_stock)
		stock <= minimum_stock ? 'danger' : ''
	end
end
