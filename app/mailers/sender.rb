class Sender < ApplicationMailer
	
	def mailbase(user, password)
		@user = user
		@password = password
		mail(to: @user.mail, subject:"Recuperar clave")
	end

end

