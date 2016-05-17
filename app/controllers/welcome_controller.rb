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


end
