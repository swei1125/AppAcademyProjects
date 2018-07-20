Rails.application.routes.draw do

  resources :users
  resource :session
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    post '/upvote', to: 'posts#upvote'
    post '/downvote', to: 'posts#downvote'
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:show] do
    post '/upvote', to: 'comments#upvote'
    post '/downvote', to: 'comments#downvote'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
