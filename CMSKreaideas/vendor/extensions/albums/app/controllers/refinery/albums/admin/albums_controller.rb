module Refinery
  module Albums
    module Admin
      class AlbumsController < ::Refinery::AdminController

        crudify :'refinery/albums/album',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
