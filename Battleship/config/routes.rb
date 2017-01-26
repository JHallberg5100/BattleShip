Rails.application.routes.draw do

  get 'ships/index'

  get 'ships/create'

  root "games#index"

  resources :games
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :boards do
    resources :ships
  end

end
