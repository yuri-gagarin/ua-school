class CreateGalleryImages < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_images do |t|
      t.integer :gallery_id
      t.string :image 

      t.timestamps
      
    end
  end
end
