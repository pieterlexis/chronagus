class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :public_description
      t.references :campaign, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end

    drop_table :player_characters do |t|
      t.string :name
      t.text :public_description
      t.text :private_description
      t.references :campaign, index: true, foreign_key: true
    end
  end
end
