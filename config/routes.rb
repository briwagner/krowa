Rails.application.routes.draw do

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :games
  resources :tags do
    resources :games, shallow: true
  end
end
