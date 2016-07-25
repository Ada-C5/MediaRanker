Rails.application.routes.draw do
  root 'home#index'

  resources :movies do
    put 'upvote'
  end

  resources :albums do
    put 'upvote'
  end

  resources :books do
    put 'upvote'
  end
end
