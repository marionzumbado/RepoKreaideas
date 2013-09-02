class StoreController < ApplicationController
  def index
  	@products=Refinery::Products::Product.all
  	unless current_member.nil?
  		@cart = current_cart
  	else
  		@session_cart=current_session_cart
  	end
  end
end
