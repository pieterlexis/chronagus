class AddAvatarDataToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :avatar_data, :json
  end
end
