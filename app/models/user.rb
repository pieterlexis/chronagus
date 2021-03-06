class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns_players, dependent: :destroy
  has_many :campaigns, through: :campaigns_players
  has_many :gm_campaigns, class_name: 'Campaign', foreign_key: :game_master_id
  has_many :player_characters, foreign_key: :player_id

  def to_s
    email.split('@').first.capitalize
  end
end
