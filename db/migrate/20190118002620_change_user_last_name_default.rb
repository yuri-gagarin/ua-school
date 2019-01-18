class ChangeUserLastNameDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :last_name, nil)
  end
end
