

Rails.application.routes.draw do

   root 'topics#index'

resources :albums do
  member do
    post 'upvote'
  end
end


resources :books do
  member do
    post 'upvote'
    end
  end




resources :movies do
  member do
    post 'upvote'
    end
  end
end
