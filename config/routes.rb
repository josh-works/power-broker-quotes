require 'sidekiq/web'
Rails.application.routes.draw do
  resources :quotes, only: [:create]
  root to: 'power_broker_quote#show'
  resources :users
  get 'home/show'
  get "/sent", to: "quotes#sent"

  # or require 'sidekiq/pro/web'
  # or require 'sidekiq-ent/web'

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
