class AddColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :grade, :integer
    add_column :courses, :period, :integer
    add_column :courses, :time, :string
  end
end
