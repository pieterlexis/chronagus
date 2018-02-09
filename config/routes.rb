Rails.application.routes.draw do
  devise_for :users

  resources :campaigns do
    resources :campaigns_players
    resources :player_characters do
      put 'toggle_active', to: 'player_characters#toggle_active'
    end
    resources :nonplayer_characters
    resources :log_entries
    resources :locations
    get 'previously-on', to: 'log_entries#previously_on', as: :previously_on
  end

  root to: 'homepage#index'
end
