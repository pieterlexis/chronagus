Rails.application.routes.draw do
  devise_for :users
  resources :player_characters, except: [:new]
  resources :log_entries, except: [:new]

  resources :campaigns do
    resources :player_characters, only: [:new]
    resources :log_entries, only: [:new]
  end

  root to: 'homepage#index'
end
