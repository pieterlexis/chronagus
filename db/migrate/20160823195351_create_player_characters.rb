class CreatePlayerCharacters < ActiveRecord::Migration
  def change
    create_table :player_characters do |t|
      t.string :name
      t.text :public_description
      t.text :private_description
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
