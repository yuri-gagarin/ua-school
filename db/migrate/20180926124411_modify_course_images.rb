class ModifyCourseImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :images
  end

end
