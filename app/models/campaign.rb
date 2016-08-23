class Campaign < ActiveRecord::Base
  has_many :player_characters
end
