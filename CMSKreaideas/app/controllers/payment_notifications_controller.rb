class PaymentNotificationsController < ApplicationController
  # GET /payment_notifications
  # GET /payment_notifications.json


  protect_from_forgery :except => [:create]

  def create
    puts"{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{"
    PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end

  def index
    @payment_notifications = PaymentNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_notifications }
    end
  end

  # GET /payment_notifications/1
  # GET /payment_notifications/1.json
  def show
    @payment_notification = PaymentNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_notification }
    end
  end

  # GET /payment_notifications/new
  # GET /payment_notifications/new.json
  def new
    @payment_notification = PaymentNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_notification }
    end
  end

  # GET /payment_notifications/1/edit
  def edit
    @payment_notification = PaymentNotification.find(params[:id])
  end



  # PATCH/PUT /payment_notifications/1
  # PATCH/PUT /payment_notifications/1.json
  def update
    @payment_notification = PaymentNotification.find(params[:id])

    respond_to do |format|
      if @payment_notification.update_attributes(payment_notification_params)
        format.html { redirect_to @payment_notification, notice: 'Payment notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_notifications/1
  # DELETE /payment_notifications/1.json
  def destroy
    @payment_notification = PaymentNotification.find(params[:id])
    @payment_notification.destroy

    respond_to do |format|
      format.html { redirect_to payment_notifications_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def payment_notification_params
      params.require(:payment_notification).permit(:cart_id, :params, :status)
    end
end
