class AddDescriptionToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :description, :string, default: ""
  end

  def down 
    remove_column :users, :description 
  end
end
