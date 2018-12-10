class CreateWorkshopImages < ActiveRecord::Migration[5.0]
  def change
    create_table :workshop_images do |t|
      t.integer "workshop_id"
      t.string "image"
      t.timestamps
    end
  end

  def down 
    drop_table :workshop_images 
  end
end
