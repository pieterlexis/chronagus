class Campaign < ActiveRecord::Base
  has_many :player_characters
  has_many :nonplayer_characters
  has_many :locations
end
