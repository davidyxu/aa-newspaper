NewspaperSubscription::Application.routes.draw do
  resources :users
  resources :subscription_plans
  resources :newspapers do
  	member do
  		match '/plan', :to => "subscription_plans#new"
  	end
  end
  resource :session

  match '/login', :to => "sessions#new"
  match '/logout', :to => "sessions#destroy", :via => :delete
  match '/register', :to => "users#new"
end
