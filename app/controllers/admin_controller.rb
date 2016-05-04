class AdminController < ApplicationController
	
	layout "adminlayout"

	def index
		render :layout => 'application'
		
	end

	def login
		render :layout => 'application'			
	end

	def menu
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		
	end

	#Listar Usuarios

	def listUsers
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		@usuarios= User.all
		
	end

	#Para crear

	def new
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		@user = User.new
		
	end
	
	def create

		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end

		username = params[:username]
		password = params[:password]
		nombre = params[:name]
		apellido = params[:lastname]
		email = params[:email]
		password_confirmation = params[:password_confirmation]
		admin=0
		blocked=0

	  	@user = User.new(:username => username, :password => password, :name => nombre, :lastname => apellido, :mail => email, :admin => admin, :blocked => blocked)    
	    if password == password_confirmation

		    if @user.save
		       @mensaje="Usuario creado con éxito."
		        render 'new'
		    else  	
		   		render 'new'
		    end
		else
			@mensaje = "* Passwords must be the same. "
			render 'new'
		end
	end


	#Para mostrar usuario

	def showselect
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		@user = User.new
	end

	def show
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		username = params[:username]
		@user = User.where(username: username).first
		if @user.nil?
			@error = "Usuario ingresado no existe."
			render :showselect
		end		
	end

	#Para editar usuario

	def edituser
	end
	
	def makeedition


		username = params[:username]
		username2 = params[:username2]
		nombre = params[:name]
		apellido = params[:lastname]
		email = params[:mail]

		@user = User.where(username: username).first


		if @user.nil?
			@error = "Usuario ingresado no existe."
			render :edituser
		elsif @user.admin==1
			@error="No se pueden editar administradores."
			render :edituser
		else
			if !username2.blank? 
				@user.username = username2
				if @user.save
					@mensaje_username = "Username cambiado con éxito. Nuevo username: '#{username2}'"
				else
					if username2.length < 3
						@mensaje_username = 'Username no se pudo cambiar, posee menos de 3 caracteres.'
					elsif username2.length > 20
						@mensaje_username = 'Username no se pudo cambiar, excedió los 20 caracteres.'
					else
						@mensaje_username = 'Username no se pudo cambiar, username ya ocupado.'
					end
				end
			end

			if !nombre.blank?
				@user.name = nombre
				if @user.save
					@mensaje_name = "Nombre cambiado con éxito. Nuevo nombre: '#{nombre}'."
				else
					@mensaje_name = 'Nombre no se pudo cambiar.'
				end
			end

			if !apellido.blank?
				@user.lastname = apellido
				if @user.save
					@mensaje_lastname = "Apellido cambiado con éxito. Nuevo nombre: '#{apellido}'."
				else
					@mensaje_lastname = 'Apellido no se pudo cambiar.'
				end
			end

			if !email.blank?
				@user.mail = email
				if @user.save
					@mensaje_email = "Email cambiado con éxito. Nuevo nombre: '#{email}'."
				else
					@mensaje_email = 'Email no se pudo cambiar. No cumple con formato pedido o ya esta ocupado'
				end
			end

			render :edituser
		end
	end

	#Cambiar Contrasena


	def changepass
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		username = params[:username]
		passnew = params[:passwordnew]
		passnew2 = params[:passwordnew2]

		@user = User.where(username: username).first

		if @user.nil?
			@error = "Usuario ingresado no existe."
			render 'passselect'
		elsif @user.admin==1
			@error="Administrador no puede ser modificado."
			render 'passselect'
		else

			if passnew.length<6
				@error = 'Contraseña nueva con menos de 6 caracteres.'
				render 'passselect'
			elsif passnew.length>20
				@error = 'Contraseña nueva excede 20 caracteres.'
				render 'passselect'
			elsif passnew != passnew2
				@error = 'Contraseña nueva y su confirmación tienen que ser iguales.'
				render 'passselect'
			else
				@user.password = passnew
				@user.save
				@error = "Contrasena del usuario #{@user.username} cambiada con éxito."
				render 'passselect'
			end
		end
	end

	#Bloquear

	def blockselect
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		@user = User.new
	end

	def block
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end

		username = params[:username]
		@user = User.where(username: username).first

		if @user.nil? then
			@error= "Usuario ingresado no existe."
			render :blockselect
		else
			if @user.blocked==1
				@error= "Usuario ingresado ya estaba bloqueado."
				render :blockselect
			elsif @user.admin==1
				@error = "No se puede bloquear a un administrador."
				render :blockselect
			else
				@user.blocked=1
				if @user.save then
					@error= "Usuario '#{@user.username}' bloqueado con éxito."
					render :blockselect
				else
					@error="Ocurrio un error inesperado al bloquear."
					render :blockselect
				end
			end
		end

	end

	#Reactiva

	def activeselect
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to root_path
		end
		@user = User.new
		
	end

	def activate
		user = User.where(id: session[:user_id]).first
		if user == nil 
			redirect_to admin_path
		elsif user.admin==0
			redirect_to rooth_path
		end

		username = params[:username]
		@user = User.where(username: username).first
		if @user.nil? then
			@error= "Usuario ingresado no existe."
			render :activeselect
		else
			if @user.blocked==0
				@error= "Usuario ingresado no estaba bloqueado."
				render :activeselect
			else
				@user.blocked=0
				if @user.save then
					@error= "Usuario '#{@user.username}' desbloqueado con éxito. "
					render :activeselect
				else
					@error="Ocurrio un error inesperado al desbloquear."
					render :activeselect
				end
			end
		end
	end
		

end
