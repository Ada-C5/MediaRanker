Rails.application.routes.draw do

  root 'ranker#index'

  get     'movies'            => 'movies#index'
  get     'movies/new'        => 'movies#new',     as: :new_movie
  post    'movies'            => 'movies#create',  as: :create_movie
  get     'movies/:id'        => 'movies#show',    as: :movie
  delete  'movies/:id'        => 'movies#delete',  as: :delete_movie
  get     'movies/:id/edit'   => 'movies#edit',    as: :edit_movie
  patch   'movies/:id/upvote' => 'movies#upvote',  as: :upvote_movie
  patch   'movies/:id/update' => 'movies#update',  as: :update_movie

  get     'books'             => 'books#index'
  get     'books/new'         => 'books#new',      as: :new_book
  post    'books'             => 'books#create',   as: :create_book
  get     'books/:id'         => 'books#show',     as: :book
  delete  'books/:id'         => 'books#delete',   as: :delete_book
  get     'books/:id/edit'    => 'books#edit',     as: :edit_book
  patch   'books/:id/upvote'  => 'books#upvote',   as: :upvote_book
  patch   'books/:id/update'  => 'books#update',   as: :update_book

  get     'albums'            => 'albums#index'
  get     'albums/new'        => 'albums#new',     as: :new_album
  post    'albums'            => 'albums#create',  as: :create_album
  get     'albums/:id'        => 'albums#show',    as: :album
  delete  'albums/:id'        => 'albums#delete',  as: :delete_album
  get     'albums/:id/edit'   => 'albums#edit',    as: :edit_album
  patch   'albums/:id/upvote' => 'albums#upvote',  as: :upvote_album
  patch   'albums/:id/update' => 'albums#update',  as: :update_album


end








# root 'search#index'
#   post 'search' => 'search#display_events', as: :display_events
#   get '/auth/:provider/callback' => 'sessions#create'
#   delete "/logout" => "sessions#destroy"
#
#   get 'users/:id' => 'users#profile' , as: :profile
#   get 'users/:id/edit' => 'users#edit_profile', as: :edit_profile
#   patch 'users/:id' => "users#update_profile", as: :update_profile
