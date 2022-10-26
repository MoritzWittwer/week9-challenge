Rails.application.routes.draw do
  resources :locations

  # # index
  # get '/locations', to: 'locations#index', as: 'locations'

  # # -> new
  # get '/locations/new', to: 'locations#new', as: 'new_location'

  # # create
  # post '/locations', to: 'locations#create'

  # # show
  # get '/locations/:id', to: 'locations#show', as: 'location'

  # # edit
  # get '/locations/:id/edit', to: 'locations#edit', as: 'edit_location'

  # # update
  # patch '/locations/:id', to: 'locations#update'

  # # destroy
  # delete '/locations/:id', to: 'locations#destroy'

  root to: 'pages#show'
  # get '/locations/morioka', to: 'pages#show', as: 'morioka'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
