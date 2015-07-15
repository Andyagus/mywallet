Rails.application.routes.draw do
  resources :sessions
  resources :cards
  
  resources :users do
      resources :cards
  end 

  namespace :admin do
      resources :sessions
  end

  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  root 'users#index'
end
