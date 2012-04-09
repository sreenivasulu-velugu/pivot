PivotIT::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [ :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
  resources :posts do
  	resources :comments
  end	


  
end
