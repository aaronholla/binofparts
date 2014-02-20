Myapp::Application.routes.draw do
  root :to => 'visitors#index'

  match '/send_mail', to: 'visitors#send_mail', via: 'post'
end
