class AddPageTypeToSchoolInfos < ActiveRecord::Migration[5.0]
  def change
    add_column :school_infos, :page_type, :integer, null: false
  end
end
