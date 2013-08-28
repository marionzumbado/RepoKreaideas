class ProductosController < ApplicationController
    #before_filter :set_product, only:[:show, :edit, :update, :destroy]

  def index
  	@products=Producto.all
  end
  def new
  	 @product = Producto.new
  end

  def show
  	
  end
  def destroy
   
  end
  def update
   
  end

 def create

 
  end
  def set_product
    @product = Producto.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(:nombre)
  end
end