class ApiKey < ActiveRecord::Base

	before_create :set_columns

	def set_columns
		self.secret_token = SecureRandom.hex
		self.enable = true
	end

end
