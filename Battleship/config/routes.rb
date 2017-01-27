Rails.application.routes.draw do

  root "games#index"


  put "/boards/:board_id/shot", to: "games#shots"
  resources :games
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :boards do
    resources :ships
  end

end
