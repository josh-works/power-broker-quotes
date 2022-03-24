Rails.application.routes.draw do
  root to: 'home#show'
  resources :users
  get 'home/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
