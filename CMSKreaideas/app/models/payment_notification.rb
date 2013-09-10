class PaymentNotification < ActiveRecord::Base
  attr_accessible :transaction_id,:params, :cart_id, :status

  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased
  include HTTParty

  private

  def mark_cart_as_purchased
    puts"00000000000000000000000000 en mask as updated"
    if status == "Completed"
        cart.update_attribute(:purshased_at, Time.now);
        #redirect_to orders #que vaya y cree la orden y borre el carrito
        puts"99999999999999999999999999999999999999999999"
     
      
    end
    cart.update_attribute(:purshased_at, Time.now);
    puts"////////////////////////////////////////////"
    
    puts"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    #HTTParty.post("http://16b02909.ngrok.com/orders")
  end




end
