Rails.application.routes.draw do

  root 'home#index'

  resources :albums, :books, :movies

  post 'movie/:id/upvote' => 'movies#upvote', as: 'upvote_movie'
end
