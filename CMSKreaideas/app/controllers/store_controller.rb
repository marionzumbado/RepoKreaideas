class StoreController < ApplicationController
  def index
  	@products=Refinery::Products::Product.all
  end
end
