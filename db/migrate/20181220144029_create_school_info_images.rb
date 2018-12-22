class CreateSchoolInfoImages < ActiveRecord::Migration[5.0]
  def up
    create_table :school_info_images do |t|
      t.integer :school_info_id, null: false
      t.string :image, null: false
      t.timestamps
    end
  end

  def down 
    drop_table :school_info_images
  end
end
