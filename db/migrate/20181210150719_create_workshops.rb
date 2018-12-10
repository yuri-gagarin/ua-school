class CreateWorkshops < ActiveRecord::Migration[5.0]
  def up
    create_table :workshops do |t|
      t.string :name, null: false
      t.string :details, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
  def down 
    drop_table :workshops
  end
end
