class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :avatar, :string
  end

  def self.down
    remove_column :users, :avatar, :string
  end
end
