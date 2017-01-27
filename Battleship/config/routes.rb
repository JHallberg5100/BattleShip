Rails.application.routes.draw do

  root "games#index"


  put "/boards/:board_id/shots", to: "games#shots"
  get "/games/:game_id/update_game", to: "games#update_game"
  resources :games
  resources :users, only: [:new, :create, :show, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :boards do
    resources :ships
  end

end
