class AddImageArrayToCourses < ActiveRecord::Migration[5.0]
  def self.up
    add_column :courses, :images, :string, array: true, default: []
  end

  def self.down
    remove_column :courses, :images
  end
end
