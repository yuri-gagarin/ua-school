class CreateGradeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :grade_images do |t|
      t.string :image
      t.integer :grade_id

      t.timestamps
    end
  end
end
