class LineItem < ActiveRecord::Base
    attr_accessible :cart_id, :product_id,:product,:quantity
  belongs_to :product ,:class_name => '::Refinery::Products::Product', :inverse_of => :line_items
  belongs_to :cart
  accepts_nested_attributes_for :product
  scope :quantity_zero, lambda{ where(quantity:0) }
  default_scope :order => 'id'


  def total_price
  		product.price*quantity
  	end


end
