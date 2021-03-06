Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :artworks, only: [:index, :show, :update, :create, :destroy]
  resources :artworkshares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: :index
  end
  

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show', as: 'user'
  # post '/users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get '/user/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  
end
