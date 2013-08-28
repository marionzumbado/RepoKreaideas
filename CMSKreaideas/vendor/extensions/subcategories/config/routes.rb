Refinery::Core::Engine.routes.draw do

  get 'admin' => 'admin#index'
  get "admin/index"
  resources :kreaideasmails
  # Frontend routes
  namespace :subcategories do
    resources :subcategories, :path => '', :only => [:index, :show] do
      
       collection do
         match 'search_by_category/:category_id' => 'admin/subcategories#search_by_category'
       end

    
     
    end
  end
  # Frontend routes
   namespace :subcategories do
    resources :subcategories, :path => '', :only => [:edit] do
      
       collection do
         match 'get_category_by_subcategory/:subcategory_id' => 'admin/subcategories#get_category_by_subcategory'
       end

    
     
    end
  end


  # Admin routes
  namespace :subcategories, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :subcategories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
