class AddLastNameToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :last_name, :string, null: false, default: 'Last Name'
    remove_column :users, :password_digest
  end

  def self.down
    remove_column :users, :last_name
    add_column :users, :password_digest, :string 
  end
end
