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
		#@cartid=current_member.cart
		#Cart.find(@cartid)
		#rescue ActiveRecord::RecordNotFound
		#	cart = Cart.create
		#	cart.member_id=current_member.id
		#	cart.member=current_member
		#	cart.save
		#	session[:cart] = cart.id
		#	cart
		#end
		
		if session[:cart]
    		@current_cart ||= Cart.find(session[:cart])
    		session[:cart] = nil if @current_cart.purshased_at
  		end
  		if session[:cart].nil?
    		@current_cart = Cart.create!
    		session[:cart] = @current_cart.id
    		@current_cart.member=current_member
  		end
  			@current_cart
		end









 	#def current_session_cart
	#	SessionCart.find(session[:session_cart])
	#	rescue ActiveRecord::RecordNotFound
	#		cart = SessionCart.create
	#		session[:session_cart] = cart.id
	#		cart
	#end

end
