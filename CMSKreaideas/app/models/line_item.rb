class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id,:product
  belongs_to :product ,:class_name => '::Refinery::Products::Product'
  belongs_to :cart
  accepts_nested_attributes_for :product

  	HUMANIZED_ATTRIBUTES = {
    :quantity => "Cantidad"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end

end
