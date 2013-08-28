module Refinery
  module Bulletins
    module Admin
      class BulletinsController < ::Refinery::AdminController

        crudify :'refinery/bulletins/bulletin',   :xhr_paging => true
      #aplication before filter
      before_filter :find_all_bulletins
      before_filter :find_page
      #my beforre filter
      before_filter :find_usercreator,:only => [:edit]
      before_filter :set_bulletin, only: [:show, :edit, :update, :destroy]
      before_filter :find_actualuser,:only => [:create]

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bulletin in the line below:
        present(@page)
      end

      def show
        @bulletin = Bulletin.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bulletin in the line below:
        present(@page)
      end

    protected

      def find_all_bulletins
        @bulletins = Bulletin.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bulletins").first
      end

      def find_usercreator
        #@bulletin2= Bulletin.find(params[:id])
      	@usercreatorname= ::Refinery::User.find(@bulletin.user_id)
      end

      def find_actualuser
        @user_id=current_refinery_user.id
      end

      def set_bulletin
        @bulletin= Bulletin.find(params[:id])
      end

      end
    end
  end
end
