class SessionLineItemsController < ApplicationController
  # GET /session_line_items
  # GET /session_line_items.json
  def index
    @session_line_items = SessionLineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @session_line_items }
    end
  end

  # GET /session_line_items/1
  # GET /session_line_items/1.json
  def show
    @session_line_item = SessionLineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session_line_item }
    end
  end

  # GET /session_line_items/new
  # GET /session_line_items/new.json
  def new
    @session_line_item = SessionLineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session_line_item }
    end
  end

  # GET /session_line_items/1/edit
  def edit
    @session_line_item = SessionLineItem.find(params[:id])
  end

  # POST /session_line_items
  # POST /session_line_items.json
  def create
    #@session_line_item = SessionLineItem.new(session_line_item_params)
    @session_cart = current_session_cart
    puts "aqui"
    product = Refinery::Products::Product.find(params[:product_id])
    puts "aqu2"
    @session_line_item = @session_cart.add_product(product.id)
    puts "aqu3"
    respond_to do |format|
      if @session_line_item.save
        format.html { redirect_to(store_index_url) }
        format.html { redirect_to @session_line_item.cart, notice: 'La line del producto ha sido creada con éxito.' }
        format.json { render json: @session_line_item, status: :created, location: @session_line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @session_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_line_items/1
  # PATCH/PUT /session_line_items/1.json
  def update
    @session_line_item = SessionLineItem.find(params[:id])

    respond_to do |format|
      if @session_line_item.update_attributes(session_line_item_params)
        if @session_line_item.quantity==0
        format.html { redirect_to store_index_url, notice: 'La linea de producto a sido eliminada con éxito.' }
        @session_line_item.destroy
      else
        format.html { redirect_to store_index_url, notice: 'La linea de producto ha sido actualizada con éxito.' }
        format.json { head :no_content }
      end

      else
        format.html { render action: "edit" }
        format.json { render json: @session_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_line_items/1
  # DELETE /session_line_items/1.json
  def destroy
    @session_line_item = SessionLineItem.find(params[:id])
    @session_line_item.destroy

    respond_to do |format|
      format.html { redirect_to session_line_items_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def session_line_item_params
      params.require(:session_line_item).permit(:session_cart_id, :product_id,:quantity)
    end
end
