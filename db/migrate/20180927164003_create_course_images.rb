class CreateCourseImages < ActiveRecord::Migration[5.0]
  def change
    create_table :course_images do |t|
      t.integer :course_id
      t.string :image

      t.timestamps
    end
  end
end
