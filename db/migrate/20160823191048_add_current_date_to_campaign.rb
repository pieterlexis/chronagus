class AddCurrentDateToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :current_date, :date, default: Time.zone.today
  end
end
