module Refinery
  module Bulletins
    class BulletinsController < ::ApplicationController

      before_filter :find_all_bulletins
      before_filter :find_page

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

    end
  end
end
