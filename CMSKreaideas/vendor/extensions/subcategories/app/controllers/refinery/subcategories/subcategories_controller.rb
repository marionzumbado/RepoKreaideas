module Refinery
  module Subcategories
    class SubcategoriesController < ::ApplicationController

      before_filter :find_all_subcategories
      before_filter :find_page
      before_filter :find_categories

      #def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:

       # present(@page)
      #end

      #def show

       # @subcategory = Subcategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @subcategory in the line below:
        #present(@page)
      #end


    #protected

     # def find_all_subcategories
      #  @subcategories = Subcategory.order('position ASC')
      #end
      #def find_categories
       # @categories = ::Refinery::Categories::Category.all
      #end

      #def find_page

#        @page = ::Refinery::Page.where(:link_url => "/subcategories").first
 #     end

    end
  end
end
