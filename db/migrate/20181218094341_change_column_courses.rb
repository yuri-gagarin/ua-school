class ChangeColumnCourses < ActiveRecord::Migration[5.0]
  def change
    change_table(:courses) do |t|
      t.column :room, :string, limit: 32
      t.remove :period
    end
  end
end
