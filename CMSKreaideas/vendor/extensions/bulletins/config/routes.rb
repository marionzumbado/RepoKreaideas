Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :bulletins do
    resources :bulletins, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :bulletins, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :bulletins, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
