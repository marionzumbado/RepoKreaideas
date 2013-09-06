class Order < ActiveRecord::Base
  attr_accessible :OrderDate, :member_id
  belongs_to :member
  has_many :line_orders, dependent: :destroy
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_orders
  attr_accessible :line_orders_attributes

  def add_line_items_from_cart(cart)
	cart.line_items.each do |item|
	item.cart_id = nil
	line_items << item
	end
   end



end
