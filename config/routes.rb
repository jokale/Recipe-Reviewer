Rails.application.routes.draw do
  resources :diets
  get '/' => "sessions#welcome"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/signup' => "users#new"
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :reviews
  resources :meals
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
