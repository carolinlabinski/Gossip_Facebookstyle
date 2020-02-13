Rails.application.routes.draw do
  get 'rails/routes'
  get '/welcome/:first_name', to: 'welcome#username', as: '/welcome/'
  get '/contact', to: 'contact#display'
  get '/team', to: 'team#display'
  root 'home#index'
  resources :gossips, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy] 
end
