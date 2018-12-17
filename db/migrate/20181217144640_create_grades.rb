class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
