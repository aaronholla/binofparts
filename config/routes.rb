Binofparts::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post "/sign_in", :to => 'session#create'
        delete "/sign_out", :to => 'session#destroy'
      end
    end
  end

  resources :events, only: %w(index show)

  resources :events do
    resources :requests
  end

  resources :teams, only: %w(index show)

  get 'about' => 'about#index'

  get 'kop' => 'kop#index'

  get 'myteam' => 'myteam#index'

  namespace :kop do
    resources :kop2013, only: %w(index show), path: "/2013"
    resources :kop2012, only: %w(index show), path: "/2012"
    resources :kop2011, only: %w(index show), path: "/2011"
    resources :kop2010, only: %w(index show), path: "/2010"
    resources :kop2009, only: %w(index show), path: "/2009"
  end

  devise_for :users, :controllers => { :invitations => 'users/invitations' }, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  authenticated :user do
    devise_scope :user do
      root to: "requests#index", :as => "home"
    end
  end
  root 'about#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
