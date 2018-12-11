class AddInfoColumnsToWorkshops < ActiveRecord::Migration[5.0]
  def change
    add_column :workshops, :room, :string
    add_column :workshops, :time, :string
  end
end
