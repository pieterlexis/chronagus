class AddPlayerIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :player_id, :integer, index: true, foreign_key: true
  end
end
