module Refinery
  module Products
    module Admin
      class ProductsController < ::Refinery::AdminController

        crudify :'refinery/products/product', :title_attribute => 'name', :xhr_paging => true
        before_filter :set_product, only: [:show, :edit, :update, :destroy]
        before_filter :find_all_categories_subcategories ,:only => [:create,:new]
        before_filter :find_categories_subcategories_for_edit, :only =>[:edit]
	    before_filter :find_all_products
	    before_filter :find_page



        def index
	      # you can use meta fields from your model instead (e.g. browser_title) by swapping @page for @product in the line below:
	      present(@page)
	    end

	    def new
	    	@product=Product.new
	    	@product.productimages.build
	    end

		

		def show
	      @product = Product.find(params[:id])
		  # you can use meta fields from your model instead (e.g. browser_title) by swapping @page for @product in the line below:
	      present(@page)
	    end

	    def edit
	      @product = Product.find(params[:id])
	      # you can use meta fields from your model instead (e.g. browser_title) by swapping @page for @product in the line below:
	      present(@page)
	    end

	    def find_new_subcategories
	      @subcategories= ::Refinery::Subcategories::Subcategory.find_all_by_category_id(66)
	    end

		protected

	    def find_all_products
	      @products = Product.order('position ASC')
	    end

	    def find_page
	      @page = ::Refinery::Page.where(:link_url => "/products").first
	    end

	    def find_all_categories_subcategories
          @categories= ::Refinery::Categories::Category.all
          @subcategories= ::Refinery::Subcategories::Subcategory.find_all_by_category_id(@categories.first)
        end

        def find_categories_subcategories_for_edit
          @idsubcategoryproduct=@product.subcategory_id
    	  @idcategorysubcategory=::Refinery::Subcategories::Subcategory.find(@idsubcategoryproduct).category_id
          @editsubcategories= ::Refinery::Subcategories::Subcategory.where(:category_id => @idcategorysubcategory)
          @editcategories= ::Refinery::Categories::Category.all
        end

        def product_params
      		params.require(:product).permit(:name, :description, :price,:bonus,:exchange,:subcategory_id,:code,:attach)
    	end

    	def set_product
      		@product = Product.find(params[:id])
    	end
             
      end
    end
  end
end
