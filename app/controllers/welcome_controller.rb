class WelcomeController < ApplicationController

def index
	@productos = Product.all
end

end
