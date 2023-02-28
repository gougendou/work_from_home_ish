Rails.application.routes.draw do
  devise_for :users
  root to: "workspaces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :workspaces do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy, :index] do
    resources :reviews, only: [:new, :create]
  end

end
