class PaymentNotificationsController < ApplicationController
  # GET /payment_notifications
  # GET /payment_notifications.json

protect_from_forgery :except => [:create]
#skip_before_filter :verify_authenticity_token, :only => [:create]
  
def create
  PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
  render :nothing => true
end

end
