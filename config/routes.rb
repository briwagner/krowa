Rails.application.routes.draw do
  root 'games#index'

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :tags, only: [:show, :new, :create, :destroy]


  get "/games/add" => "games#add_index", as: :add_game_index
  get "/games/add/:api_id" => "games#add", as: :add_game
  post "/games/add" => "games#add_create", as: :add_game_create

  resources :games do
  	resources :reviews
    resources :collections #, shallow: true

  end

  resources :friend_requests, only: [:create, :destroy, :update]

end
