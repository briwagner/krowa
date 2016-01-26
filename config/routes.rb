Rails.application.routes.draw do
  root 'games#index'

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :tags, only: [:show, :new, :create, :destroy]

  resources :games do
    resources :collections, shallow: true
  end

end
