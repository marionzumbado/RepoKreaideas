Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :albums do
    resources :albums, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :albums, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :albums, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
