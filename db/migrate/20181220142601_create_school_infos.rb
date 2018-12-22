class CreateSchoolInfos < ActiveRecord::Migration[5.0]
  def up
    create_table :school_infos do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.timestamps
    end
  end

  def down 
    drop_table :school_infos
  end
end
