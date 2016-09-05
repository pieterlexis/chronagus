class Campaign < ActiveRecord::Base
  has_many :player_characters
  has_many :nonplayer_characters
  has_many :locations

  has_many :campaigns_players, dependent: :destroy
  has_many :players, through: :campaigns_players, source: :user
end
