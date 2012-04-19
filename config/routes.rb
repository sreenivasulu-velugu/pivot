PivotIT::Application.routes.draw do
  root :to => "home#index"
  resources :users do
  	member do
    	get :follow_pivoters
    	post :follow_pivoters
    	get :following
    	get :unfollow
      get :like_post
      get :unlike_post

    end
  end
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
  resources :posts do
  	resources :comments
  end	
  

  
end
