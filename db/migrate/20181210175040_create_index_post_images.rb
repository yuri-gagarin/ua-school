class CreateIndexPostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :index_post_images do |t|
      t.integer :index_post_id
      t.string :image

      t.timestamps
    end
  end
end
