class SessionCart < ActiveRecord::Base
  # attr_accessible :title, :body
  	has_many :session_line_items, :dependent => :destroy
	accepts_nested_attributes_for :session_line_items
	attr_accessible :session_line_items_attributes
	after_save :delete_quantity_zero


	 HUMANIZED_ATTRIBUTES = {
    :quantity => "Cantidad"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end



	def add_product(product_id)
		current_item = session_line_items.where(:product_id => product_id).first
		if current_item
			current_item.quantity += 1
		else
			current_item = session_line_items.build(:product_id => product_id)
		end
		current_item
  	end

  	def total_price
		session_line_items.to_a.sum { |item| item.total_price }

	end

	def delete_quantity_zero
		SessionLineItem.delete session_line_items.quantity_zero
	end
end
