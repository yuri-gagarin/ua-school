class CreateIndexPosts < ActiveRecord::Migration[5.0]
  def up
    create_table :index_posts do |t|
      t.string :title
      t.string :description
      t.integer :type
      t.timestamps
    end
  end

  def down 
    drop_table :index_posts 
  end
end
