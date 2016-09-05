class AddGameMasterIdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :game_master_id, :integer, index: true, foreign_key: true
  end
end
