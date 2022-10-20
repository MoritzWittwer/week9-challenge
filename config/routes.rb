Rails.application.routes.draw do
  root to: 'pages#show'
  get '/locations/morioka', to: 'pages#show', as: 'morioka'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
