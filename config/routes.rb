Binofparts::Application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :events, only: [:index, :show] do
        resources :requests, except: [:show]
        get 'requests/:id' => 'requests#team'
        get 'requests/update_feed' => 'requests#update_feed'
        post 'requests/:id/accept' => 'requests#accept'
        resources :inventories, only: [:index, :create, :destroy]
        post 'inventories/remove_from_inv' => 'inventories#remove_from_inv'
      end
      resources :teams, only: [:index, :show]
      get 'kop/:id' => 'kop#show'
      get 'parts/:id' => 'parts#category'
    end
  end

  resources :events, only: %w(index show) do
    resources :requests,except: %w(new edit)
    post 'requests/:id/accept' => 'requests#accept', :as => 'accept_request'
  end


  resources :teams, only: %w(index show)

  get 'about' => 'about#index'  
  get 'kop' => 'kop#index'
  get 'kop/:id' => 'kop#show', :as => 'kop_year'

  get 'myteam' => 'myteam#index'

  devise_for :users, :controllers => { :invitations => 'users/invitations', :registrations => "settings" }, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  authenticated :user do
    devise_scope :user do
      root to: "home#index", :as => "home"
      get 'home/update_feed' => 'home#update_feed'
      get '/new_request/set_cat' => 'events#set_cat'
      get '/new_request/set_part' => 'events#set_part'
      get 'settings' => 'devise/registrations#edit', :as => 'edit_user_registration'    
      patch 'users/:id' => 'devise/registrations#update', :as => 'user_registration' 
      delete 'users/:id' => 'devise/registrations#destroy', :as => 'delete_user_registration'
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
