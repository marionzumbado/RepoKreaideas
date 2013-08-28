Refinery::Core::Engine.routes.draw do

  #match 'user_root' => redirect("/wherever/you/want")
  # Frontend routes
  namespace :products do
    resources :products, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :products, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :products, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
