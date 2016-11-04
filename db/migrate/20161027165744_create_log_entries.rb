class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.string :title
      t.text :text
      t.date :ic_date
      t.date :oc_date
      t.references :campaign, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
