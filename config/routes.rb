Rails.application.routes.draw do
  devise_for :users
  root to: "workspaces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/workspaces/my_workspaces', to: 'workspaces#my_workspaces'
  resources :workspaces do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:destroy, :index]
  resources :favourites, only: [:index, :destroy, :create]
end
