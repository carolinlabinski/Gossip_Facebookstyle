Rails.application.routes.draw do
  get '/welcome/:first_name', to: 'welcome#username', as: '/welcome/'
  get '/contact', to: 'contact#display'
  get '/team', to: 'team#display'
  root 'home#index'
  resources :gossips, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :users, only: [:show, :new, :create]
end
