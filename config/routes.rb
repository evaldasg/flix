Flix::Application.routes.draw do


  resources :genres

  resources :users

  root "movies#index"

  resources :movies do
    resources :reviews
    resources :favorites
  end
  get "upcoming" => "movies#upcoming"
  get "recently_added" => "movies#recently_added"
  get "hits" => "movies#hits"

  get "signup" => "users#new"

  resource :session

  get "signin" => "sessions#new"

end
