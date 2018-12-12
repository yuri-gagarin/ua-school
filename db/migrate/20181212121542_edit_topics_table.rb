class EditTopicsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :category, :string
    add_column :topics, :user_id, :integer, {null: false, index: true}
    remove_column :topics, :public
  end
end
