Rails.application.routes.draw do


  root "games#index"

  resources :games
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

end
