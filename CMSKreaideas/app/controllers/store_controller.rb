class StoreController < ApplicationController
  def index
  	puts"#{current_cart.purchased_at}"
  	@products=Refinery::Products::Product.all
  	unless current_member.nil?
  		@cart = current_cart
  	end





  end
  
end
