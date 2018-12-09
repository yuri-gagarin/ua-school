class AddInfoToGallery < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :title, :string
    add_column :galleries, :description, :string
  end
end
