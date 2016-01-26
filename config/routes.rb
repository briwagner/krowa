Rails.application.routes.draw do

  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :games do
    resources :collections, shallow: true
  end
end
