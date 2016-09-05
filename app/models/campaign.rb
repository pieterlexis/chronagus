class Campaign < ActiveRecord::Base
  has_many :player_characters
  has_many :nonplayer_characters
  has_many :locations

  has_many :campaigns_players, dependent: :destroy
  has_many :players, through: :campaigns_players, source: :user

  belongs_to :game_master, class_name: 'User', foreign_key: :game_master_id
end
