class WelcomeController < ApplicationController

def index
	@productos = Product.all
end

def vinos
	@productos = Product.all
end

def ofertas
	@productos = Product.all
end

def smartwatch
	@productos = Product.all
end

def show

	id = params[:product_id]
	@prod = Product.where(id: id).first
	
end

def edit
	if User.where(id: session[:user_id]).first.admin==0 then
		redirect_to root_path
	end
	id = params[:product_id]
	@prod = Product.where(id: id).first
end

def makeEdition
	if User.where(id: session[:user_id]).first.admin==0 then
		redirect_to root_path
	end
		titulo = params[:title]
		descripcion = params[:description]
		precio = params[:price]
		categoria = params[:category]

		@producto = Product.where(id: params[:product_id]).first

		
			if !titulo.blank? 
				@producto.title = titulo
			end

			if !descripcion.blank?
				@producto.description = descripcion
			end

			if !precio.blank?
				if number_or_nil(precio)!=nil
					@producto.price = number_or_nil(precio)
				else
					@mensaje_precio = "Precio no corresponde a numero"
				end
			end

			@producto.category = categoria

			@producto.save
		

			redirect_to root_path
		
end

def number_or_nil(string)
  Integer(string || '')
rescue ArgumentError
  nil
end

end
