class CreateCampaignsPlayers < ActiveRecord::Migration
  def change
    create_table :campaigns_players do |t|
      t.references :user, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :campaigns_players, [:user_id, :campaign_id], unique: true
  end
end
