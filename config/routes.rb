Rails.application.routes.draw do
  resources :quotes, only: [:create]
  root to: 'home#show'
  resources :users
  get 'home/show'
  get "/sent", to: "quotes#sent"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
