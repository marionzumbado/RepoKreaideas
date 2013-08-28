module Refinery
  module Categories
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/categories/category',:title_attribute => 'name',:xhr_paging => true

        before_filter :find_all_categories
        before_filter :find_page

        def index
          # you can use meta fields from your model instead (e.g. browser_title)
          # by swapping @page for @category in the line below:
          present(@page)
        end

        def destroy
          @category.destroy     
          rescue ActiveRecord::DeleteRestrictionError => e  
            @category.errors.add(:base, e)
            flash[:error] = "La categoria no se pudo eliminar debido a que esta asociada con una subcategoria"
            render :index
          else
            flash[:notice] = "Borrado correctamente"
            render :index
        end
        
        def show
          @category = Category.find(params[:id])

          # you can use meta fields from your model instead (e.g. browser_title)
          # by swapping @page for @category in the line below:
          present(@page)
        end

      protected

        def find_all_categories
          @categories = Category.order('position ASC')
        end

        def find_page
          @page = ::Refinery::Page.where(:link_url => "/categories").first
        end

              

      end
    end
  end
end
