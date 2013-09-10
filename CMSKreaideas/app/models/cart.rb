class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

	belongs_to :member
	accepts_nested_attributes_for :line_items
	attr_accessible :line_items_attributes
	after_save :delete_quantity_zero



	 HUMANIZED_ATTRIBUTES = {
    :quantity => "Cantidad"
 	 }

    def self.human_attribute_name(attr, options={})
    	HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  	end

  	def paypal_encrypted(return_url,notify_url)
  		values = {
  			:business=>'kreaideaspayment@gmail.com',
  			:cmd => '_cart',
  			:upload => 1,
  			:return => return_url,
  			:invoice => id,
        :notify_url => notify_url,
        :cert_id => "XTJLHK3UZBB3G"
  		}
  		line_items.each_with_index do |item, index|
  			values.merge!({
  				"amount_#{index+1}" => item.total_price,
  				"item_name_#{index+1}"=> item.product.name,
  				"item_number_#{index+1}"=> item.id,
  				"quantity_#{index+1}"=> item.quantity
  				})
  		end

  		encrypt_for_paypal(values)

  	end



    PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
    APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
    APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

    def encrypt_for_paypal(values)
      signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
      OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
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

	def delete_quantity_zero
		LineItem.delete line_items.quantity_zero
	end




end