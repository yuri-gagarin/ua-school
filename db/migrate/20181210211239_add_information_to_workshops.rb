class AddInformationToWorkshops < ActiveRecord::Migration[5.0]
  def change
    change_table :workshops do |t|
      t.string :price
      t.string :instructor
    end
  end
end
