class AddSlugToIndexPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :index_posts, :slug, :string
    add_index :index_posts, :slug
  end
end
