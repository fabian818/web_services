class ApiKey < ActiveRecord::Base

	before_create :set_columns
	before_create :generate_access_token

	def set_columns
		self.enable = true
	end

	def generate_access_token
		begin
			self.secret_token = SecureRandom.hex	
		end while self.class.exists?(secret_token: secret_token)
	end

end
