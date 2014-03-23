Flix::Application.routes.draw do


  resources :genres

  resources :users

  root "movies#index"

  get "upcoming" => "movies#upcoming"
  get "recently_added" => "movies#recently_added"
  get "hits" => "movies#hits"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies
  # get "movies/filter/flops" => "movies#index", filter: "flops"

  resources :movies do
    resources :reviews
    resources :favorites
  end

  get "signup" => "users#new"

  resource :session

  get "signin" => "sessions#new"

end
