class RemoveRedundantGradeColumnCourses < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :grade
  end
end
