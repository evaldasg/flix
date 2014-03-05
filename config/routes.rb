Flix::Application.routes.draw do
  resources :users

  root "movies#index"

  resources :movies do
    resources :reviews
  end
  get "upcoming" => "movies#upcoming"
  get "recently_added" => "movies#recently_added"
  get "hits" => "movies#hits"

  get "signup" => "users#new"

end
