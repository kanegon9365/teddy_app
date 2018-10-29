Rails.application.routes.draw do
  root 'users#home'
  get '/about', to: 'users#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/succeed', to: 'users#succeed'
  get '/users/:id', to: 'users#show'
  resources :users
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
