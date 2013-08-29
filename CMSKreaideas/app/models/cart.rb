class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
	has_many :line_items, :dependent => :destroy
	accepts_nested_attributes_for :line_items
	attr_accessible :line_items_attributes


	 HUMANIZED_ATTRIBUTES = {
    :quantity => "Cantidad"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end



	def add_product(product_id)
		current_item = line_items.where(:product_id => product_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(:product_id => product_id)
		end
		current_item
  	end

  	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
