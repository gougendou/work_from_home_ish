Rails.application.routes.draw do
  get 'workspaces/index'
  get 'workspaces/show'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :workspaces, only: [:index, :show]
end
