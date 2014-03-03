Flix::Application.routes.draw do
  resources :reviews

  root "movies#index"
  resources :movies
  get "upcoming" => "movies#upcoming"
  get "recently_added" => "movies#recently_added"
  get "hits" => "movies#hits"

end
