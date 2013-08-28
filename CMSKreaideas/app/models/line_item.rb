class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id,:product
  belongs_to :product ,:class_name => '::Refinery::Products::Product'
  belongs_to :cart
end
