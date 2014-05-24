class DevelopmentMailInterceptor
	def self.delivering_email(message)
		message.subject= "#{message.to} #{message.subject}"
		message.to= "sknhkn.gang@gmail.com"
	end
end	