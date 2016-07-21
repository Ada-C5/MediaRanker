Rails.application.routes.draw do

  root 'home#index'

  resources :albums, :books, :movies
end
