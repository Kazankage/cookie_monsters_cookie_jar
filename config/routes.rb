Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/auth/:provider/callback' => 'sessions#omniauth'
  
  resources :reviews 
  resources :cookies do
    resources :reviews, only: [:new, :index]
  end

  
  resources :brands
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'sessions#welcome'
end
