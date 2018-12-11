class AddDescriptionToGalleryImage < ActiveRecord::Migration[5.0]
  def up
    add_column :gallery_images, :description, :string, default: ""
  end

  def down
    drop_column :gallery_images, :description
  end
end
