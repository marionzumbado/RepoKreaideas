class SessionCartsController < ApplicationController
  # GET /session_carts
  # GET /session_carts.json
  def index
    @session_carts = SessionCart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @session_carts }
    end
  end

  # GET /session_carts/1
  # GET /session_carts/1.json
  def show
    begin
      @session_cart = SessionCart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Intento de acceso inv'alido a carrito #{params[:id]}"
      redirect_to store_index_url , :notice => 'Carrito inválido'
    else
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session_cart }
    end
  end
  end

  # GET /session_carts/new
  # GET /session_carts/new.json
  def new
    @session_cart = SessionCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session_cart }
    end
  end

  # GET /session_carts/1/edit
  def edit
    @session_cart = SessionCart.find(params[:id])
  end

  # POST /session_carts
  # POST /session_carts.json
  def create
    @session_cart = SessionCart.new(session_cart_params)

    respond_to do |format|
      if @session_cart.save
        format.html { redirect_to @session_cart, notice: 'Session cart was successfully created.' }
        format.json { render json: @session_cart, status: :created, location: @session_cart }
      else
        format.html { render action: "new" }
        format.json { render json: @session_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_carts/1
  # PATCH/PUT /session_carts/1.json
  def update
    @session_cart = SessionCart.find(params[:id])

    respond_to do |format|
      if @session_cart.update_attributes(session_cart_params)
        format.html { redirect_to @session_cart, notice: 'Session cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_carts/1
  # DELETE /session_carts/1.json
  def destroy
    @session_cart = current_session_cart
    @session_cart.destroy
    session[:session_cart_id]=nil
    respond_to do |format|
      format.html { redirect_to (store_index_url,:notice => "Su carrito ha sido eliminado") }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def session_cart_params
      params.require(:session_cart).permit(session_line_items_attributes: [:id, :quantity])
    end
end
