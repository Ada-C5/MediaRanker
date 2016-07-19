

Rails.application.routes.draw do
resources :movies do
  member do
    post 'upvote'
    end
  end
end
