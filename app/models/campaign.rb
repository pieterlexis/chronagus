class Campaign < ActiveRecord::Base
  has_many :player_characters
  has_many :nonplayer_characters
  has_many :locations
  has_many :log_entries

  has_many :campaigns_players, dependent: :destroy
  has_many :players, through: :campaigns_players, source: :user

  belongs_to :game_master, class_name: 'User', foreign_key: :game_master_id

  def update_current_date
    latest_log_date = log_entries.pluck(:ic_date).max
    update(current_date: latest_log_date) if latest_log_date
  end

  def member?(user)
    user.id == game_master_id || campaigns_players.pluck(:id).include?(user.id)
  end

  def members
    member_ids = players.pluck(:id) << game_master_id
    User.where(id: member_ids)
  end
end
