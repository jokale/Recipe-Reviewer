Rails.application.routes.draw do
  
  get '/' => "sessions#welcome"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/signup' => "users#new"
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  resources :reviews
  resources :diets
  resources :recipes do 
    resources :reviews, only: [:new, :index]

  end 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
