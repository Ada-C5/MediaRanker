Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
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

  resources :books do
    member do
      put 'upvote'
    end
  end
end
