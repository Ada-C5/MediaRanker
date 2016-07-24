Rails.application.routes.draw do

  root 'home#index'

  resources :albums, :books, :movies

  post 'movie/:id/upvote' => 'movies#upvote', as: 'upvote_movie'
  post 'book/:id/upvote' => 'books#upvote', as: 'upvote_book'
  post 'album/:id/upvote' => 'albums#upvote', as: 'upvote_album'

end
