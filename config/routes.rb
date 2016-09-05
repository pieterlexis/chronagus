Rails.application.routes.draw do
  devise_for :users
  resources :player_characters

  resources :campaigns do
    resources :player_characters, only: [:new]
  end

  root to: 'homepage#index'
end
