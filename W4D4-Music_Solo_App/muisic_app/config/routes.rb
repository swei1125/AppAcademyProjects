Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(new create show)
  resource :session, only: %i(new create destroy)

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: :new
  end
  resources :tracks, except: [:new, :index]
end
