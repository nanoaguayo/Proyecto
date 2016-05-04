class User < ActiveRecord::Base
	before_save :encrypt_password


	def encrypt_password
	  if password.present? && password.length>=6 && password.length<=20
	    self.salt = BCrypt::Engine.generate_salt
	    self.password= BCrypt::Engine.hash_secret(password, salt)
	  end
	end


	EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\Z/i
	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :mail, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates_length_of :password, :in => 6..20, :on => :create
	validates :name, :presence=>true
	validates :lastname, :presence=>true

	def self.authenticate(login_username="", login_password="")
	    user = User.find_by_username(login_username)
  	
		if user && user.match_password(login_password)
		    return user
		else
	    	return false
	  	end
	end   

	def match_password(login_password="")
	  password == BCrypt::Engine.hash_secret(login_password, salt)
	end

end