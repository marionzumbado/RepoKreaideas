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
		Cart.find(session[:cart])
		rescue ActiveRecord::RecordNotFound
			cart = Cart.create
			session[:cart] = cart.id
			puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA#{cart.id}"
			cart
	end

 	def current_session_cart
		SessionCart.find(session[:session_cart])
		rescue ActiveRecord::RecordNotFound
			cart = SessionCart.create
			session[:session_cart] = cart.id
			puts "BBBBBBBBBBBBBBBBBBBBBBBBBBA#{cart.id}"
			cart
	end

end
