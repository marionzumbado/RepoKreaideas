class ApplicationController < ActionController::Base
#  include Refinery::AuthenticatedSystem
  protect_from_forgery  with: :exception
  #before_filter :authenticate

 #def authenticate
  #unless Kreaideasuser.find_by_id(session[:user_id])
  #	redirect_to login_url,rai notice: "Inicie Sesión"
  #end


 # end

 private

 	def current_cart
		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
	end
end
