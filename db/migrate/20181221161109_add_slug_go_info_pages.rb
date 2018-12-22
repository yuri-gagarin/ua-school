class AddSlugGoInfoPages < ActiveRecord::Migration[5.0]
  def change
    add_column :school_infos, :slug, :string
  end
end
