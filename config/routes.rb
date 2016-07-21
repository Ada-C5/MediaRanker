Rails.application.routes.draw do
  root "home#index"

  resources :books do
    member do
      put 'rank'
    end
  end

  resources :movies do
    member do
      put 'rank'
    end
  end

  resources :albums do
    member do
      put 'rank'
    end
  end

end

