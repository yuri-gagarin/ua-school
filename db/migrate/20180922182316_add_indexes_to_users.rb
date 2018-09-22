class AddIndexesToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_index :users, :email,                unique: true
    add_index :users, :confirmation_token,   unique: true
  end

  def self.down
    remove_index :users, :email 
    remove_index :users, :confirmation_token
  end
end
