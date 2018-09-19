class CreateCourses < ActiveRecord::Migration[5.0]
  def self.up
    create_table :courses do |t|

      t.string :name, null: false, unique: true
      t.string :description, null: false, unique: true
      t.references :user, foreign_key: true
      t.timestamps      
    end


  end

  def self.down 
    drop_table :courses 
  end

end
