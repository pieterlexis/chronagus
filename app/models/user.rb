class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns_players, dependent: :destroy
  has_many :campaigns, through: :campaigns_players
  has_many :gm_campaigns, class_name: 'Campaign', foreign_key: :game_master_id
end
