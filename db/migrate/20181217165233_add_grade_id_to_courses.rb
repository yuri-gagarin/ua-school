class AddGradeIdToCourses < ActiveRecord::Migration[5.0]
  def up
    add_column :courses, :grade_id, :integer
  end

  def down
    remove_column :courses, :grade_id
  end
end
