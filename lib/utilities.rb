module Utilities
	def create_error_response(code, message)
		return "{\"error\": { \"code\": #{code},\"message\": \"#{message}\"}}"
	end
	module_function :create_error_response
end