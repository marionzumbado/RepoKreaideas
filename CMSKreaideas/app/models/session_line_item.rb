class SessionLineItem < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :session_cart_id, :product_id,:product,:quantity
  belongs_to :product ,:class_name => '::Refinery::Products::Product'
  belongs_to :session_cart
  accepts_nested_attributes_for :product
  scope :quantity_zero, lambda{ where(quantity:0) }
  default_scope :order => 'id'
  


  def total_price
  		product.price*quantity
  end
end
