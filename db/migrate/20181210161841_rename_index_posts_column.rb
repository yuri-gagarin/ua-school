class RenameIndexPostsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :index_posts, :type, :page_type
  end
end
