ActionController::Routing::Routes.draw do |map|
  
  map.resources :users do |users|
	users.resources :messages
	users.resources :subscriptions
  end
  
  map.root :controller => "users"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
