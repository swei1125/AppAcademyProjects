Rails.application.routes.draw do
  # Your routes here!

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
  # Your routes here
    resources :guests, only: [:index, :show] do
      resources :gifts, only: :index
    end
    resources :gifts, only: [:index, :show]
    resources :parties, only: [:show, :index]
  end
end
