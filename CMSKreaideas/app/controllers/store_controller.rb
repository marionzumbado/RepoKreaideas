class StoreController < ApplicationController
  def index
  	@products=Refinery::Products::Product.all
  	@cart = current_cart
  end
end
