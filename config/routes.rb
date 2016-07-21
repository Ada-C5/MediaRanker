Rails.application.routes.draw do
  root "home#index"

  resources :books do
    member do
      put 'upvote'
    end
  end

  resources :movies do
    member do
      put 'upvote'
    end
  end

  resources :albums do
    member do
      put 'upvote'
    end
  end

end

