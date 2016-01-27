Rails.application.routes.draw do
  root 'games#index'

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :tags, only: [:show, :new, :create, :destroy]
  resources :groups, only: [:index, :show]
  resources :memberships, only: [:create, :destroy]

  get "/games/add" => "games#add_index", as: :add_game_index
  get "/games/add/:api_id" => "games#add_show", as: :add_game_show
  post "/games/add" => "games#add_create", as: :add_game_create

  post "/games/:game_id/taggings/:id" => "taggings#create"
  delete "/games/:game_id/taggings/:id" => "taggings#destroy"

  resources :games do
  	resources :reviews
    resources :collections #, shallow: true

  end

  resources :friend_requests, only: [:create, :destroy, :update]

end
