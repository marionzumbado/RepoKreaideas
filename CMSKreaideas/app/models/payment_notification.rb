class PaymentNotification < ActiveRecord::Base
  attr_accessible :transaction_id,:params, :cart_id, :status

  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  private

  def mark_cart_as_purchased
    if status == "Completed"
        #cart.update_attribute(:purchased_at, Time.now);
        #redirect_to orders #que vaya y cree la orden y borre el carrito
        puts"99999999999999999999999999999999999999999999"
     
      
    end
    puts"////////////////////////////////////////////"
  
  end




end
