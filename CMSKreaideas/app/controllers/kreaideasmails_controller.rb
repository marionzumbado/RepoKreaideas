class KreaideasmailsController < ApplicationController
  # GET /kreaideasmails
  # GET /kreaideasmails.json
  def index
    @kreaideasmails = Kreaideasmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kreaideasmails }
    end
  end

  # GET /kreaideasmails/1
  # GET /kreaideasmails/1.json
  def show
    @kreaideasmail = Kreaideasmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kreaideasmail }
    end
  end

  # GET /kreaideasmails/new
  # GET /kreaideasmails/new.json
  def new
    @kreaideasmail = Kreaideasmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kreaideasmail }
    end
  end

  # GET /kreaideasmails/1/edit
  def edit
    @kreaideasmail = Kreaideasmail.find(params[:id])
  end

  # POST /kreaideasmails
  # POST /kreaideasmails.json
  def create
    @kreaideasmail = Kreaideasmail.new(kreaideasmail_params)
    Notifier.emailcontact_received(@kreaideasmail).deliver
    respond_to do |format|
      if @kreaideasmail.save
        format.html { redirect_to @kreaideasmail, notice: 'El correo a sido enviado con éxito.' }
        format.json { render json: @kreaideasmail, status: :created, location: @kreaideasmail }
      else
        format.html { render action: "new" }
        format.json { render json: @kreaideasmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kreaideasmails/1
  # PATCH/PUT /kreaideasmails/1.json
  def update
    @kreaideasmail = Kreaideasmail.find(params[:id])

    respond_to do |format|
      if @kreaideasmail.update_attributes(kreaideasmail_params)
        format.html { redirect_to @kreaideasmail, notice: 'EL correo a sido actualizado con éxito.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kreaideasmail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kreaideasmails/1
  # DELETE /kreaideasmails/1.json
  def destroy
    @kreaideasmail = Kreaideasmail.find(params[:id])
    @kreaideasmail.destroy

    respond_to do |format|
      format.html { redirect_to kreaideasmails_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def kreaideasmail_params
      params.require(:kreaideasmail).permit(:email, :message, :name)
    end
end
