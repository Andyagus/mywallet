Rails.application.routes.draw do
  resources :sessions
  resources :cards
  
  resources :users do
      resources :cards 
  end 

  namespace :admin do
    resources :sessions, only: [:create, :new, :destroy]
    resources :cards, only: [:index, :destroy]
  end

  get '/ajax-link-test' => 'users#ajax_test', as: 'ajax_link'

  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  root 'users#index'

end
