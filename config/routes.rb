Rails.application.routes.draw do
  root 'games#index'

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :tags, only: [:show, :new, :create, :destroy]


  get "/games/add" => "games#add", as: :add_game

  resources :games do
  	resources :reviews
    resources :collections, shallow: true

  end


end
