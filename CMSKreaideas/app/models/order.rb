class Order < ActiveRecord::Base
  attr_accessible :OrderDate, :member_id,:line_items_attributes
  belongs_to :member
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items


  

  def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
	 item.cart_id = nil
	 line_items << item
	end
   end



end
