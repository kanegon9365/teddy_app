Rails.application.routes.draw do
  
  
  get 'likes/create'
  get 'likes/destroy'
  root 'users#home'
  get '/about', to: 'users#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/succeed', to: 'users#succeed'
  get '/index',to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/search/tweetpost', to: 'users#search_all'
  resources :users do
    member do
      get 'edit_password'
      get :following, :followers
    end
  end
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :tweetposts, only: [:create, :destroy, :show, :new] do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
