Myapp::Application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root :to => 'visitors#index'

  match '/send_mail', to: 'visitors#send_mail', via: 'post'
end
