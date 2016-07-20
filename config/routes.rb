Rails.application.routes.draw do
 
 root "home#index"

 resources :movies, :except => [:new, :create]
 resources :books, :except => [:new, :create]
 resources :albums, :except => [:new, :create]

end
