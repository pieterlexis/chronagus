Rails.application.routes.draw do
  devise_for :users
  resources :player_characters, except: [:new]
  resources :nonplayer_characters, except: [:new]
  resources :log_entries, except: [:new]
  resources :locations, except: [:new]

  resources :campaigns do
    resources :player_characters
    resources :nonplayer_characters
    resources :log_entries
    resources :locations
  end

  root to: 'homepage#index'
end
