Rails.application.routes.draw do
  root 'home#index'

  resources :movies, :albums, :books

end
