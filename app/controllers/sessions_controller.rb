class SessionsController < ApplicationController
	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
    #Login Form
    if session[:user_id]!= nil
      redirect_to root_path
    end
    
  end

  def login_attempt
    authorized_user = User.authenticate(params[:login_username],params[:login_password])
    if authorized_user
      if authorized_user.blocked == 1
          @message = "Esta cuenta está bloqueada."
          render "login"
      else
      	session[:user_id] = authorized_user.id
        redirect_to user_account_path
      end
    else
    	@message = "Nombre de usuario o contraseña invalida."
      	render "login"	
    end
  end

  def login_admin
    if session[:user_id]!= nil
      redirect_to root_path
    end
  end
  
  def login_attempt_admin
    authorized_user = User.authenticate(params[:login_username],params[:login_password])
    if authorized_user
      if authorized_user.admin == 1
        session[:user_id] = authorized_user.id
        redirect_to admin_menu_path
      else
        @message = "Usuario ingresado no es administrador."
        render "login_admin"
      end
    else
      @message = "Username o contraseña invalida."
      render "login_admin" 
    end
  end
  
	def logout
	  session[:user_id] = nil
	  redirect_to root_path
	end

  
  def profile
  end

  def setting
  end

  def recover
  end

  def sendpass
    username = params[:username]
    @user = User.where(username: username).first

    @password = SecureRandom.hex(7)
    @user.password = @password
    @user.save

    if Sender.mailbase(@user,@password).deliver_now
      @message= "Enviado con exito"
      render 'recover'
    else
      @message= "No se puedo enviar"
      render 'recover'
    end
  end
  
end
