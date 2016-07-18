Rails.application.routes.draw do

  root 'articles#index'
  get '/movies' => 'articles#movies', as: 'movies'
  get '/books' => 'articles#books', as: 'books'
  get '/albums' => 'articles#albums', as: 'albums'

  resources :articles


end
