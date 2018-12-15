class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
