Rails.application.routes.draw do
  root                        to: "home#index"
  get     'movies',           to: 'movies#index'
  get     'movies/:id',       to: 'movies#show', as: :movie
  get     'movies/:id/edit',  to: 'movies#edit'
  patch   'movies/:id',       to: 'movies#update'
  delete  'movies/:id',       to: 'movies#destroy' 

  get     'books',            to: 'books#index'
  get     'books/:id',        to: 'books#show', as: :book
  get     'books/:id/edit',   to: 'books#edit'
  patch   'books/:id',        to: 'books#update'
  delete  'books/:id',        to: 'books#destroy' 

  get     'albums',           to: 'albums#index'
  get     'albums/:id',       to: 'albums#show', as: :album
  get     'albums/:id/edit',  to: 'albums#edit'
  patch   'albums/:id',       to: 'albums#update'
  delete  'albums/:id',       to: 'albums#destroy' 
end

