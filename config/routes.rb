Rails.application.routes.draw do
 
 root "home#index"

 resources :movies
 put "movies/:id/upvote" => "movies#upvote", as: :movie_upvote

 resources :books
  put "books/:id/upvote" => "books#upvote", as: :book_upvote

 resources :albums
 put "albums/:id/upvote" => "albums#upvote", as: :album_upvote

end
