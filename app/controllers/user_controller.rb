class UserController < ApplicationController
	before_filter :save_login_state, :only => [:new, :create]
	layout 'userlayout'

	def account
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to sessions_login_path
		end
	end

	def data
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to sessions_login_path
		end
	end

	def changepass
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to sessions_login_path
		end
	end

	def user_param
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to sessions_login_path
		end
		params.require(:user).permit(:password,:salt)
	end

	def makechangepass
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to sessions_login_path
		end
		pass= params[:password]
		passnew = params[:passwordnew]
		passnew2 = params[:passwordnew2]

		user = User.where(id: session[:user_id]).first

		pass = BCrypt::Engine.hash_secret(pass, user.salt)

		if user.password == pass then
			#vemos condicion y cambiamos
			if passnew.length<6
				@error = 'Contrasena nueva con menos de 6 caracteres,'
				render 'changepass'
			elsif passnew.length>20
				@error = 'Contrasena nueva excede 20 caracteres.'
				render 'changepass'
			elsif passnew != passnew2
				@error = 'Contrasenas ingresadas tienen que ser iguales.'
				render 'changepass'
			else
				user.password = passnew
				user.save
				@error = 'Contrasena cambiada con éxito.'
				render 'changepass'
			end

		else
			@error="Contrasena actual incorrecta."
			render 'changepass'
		end
	end

end
