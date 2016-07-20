Rails.application.routes.draw do
 
 root "home#index"

 resources :movies, :except => [:new, :create]
 put "movies/:id/upvote" => "movies#upvote", as: :movie_upvote

 resources :books, :except => [:new, :create]
 resources :albums, :except => [:new, :create]

end
