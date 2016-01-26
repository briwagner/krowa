Rails.application.routes.draw do

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :games do
  	resources :reviews
    resources :collections, shallow: true

  end

  resources :tags do
    resources :games
  end


end
