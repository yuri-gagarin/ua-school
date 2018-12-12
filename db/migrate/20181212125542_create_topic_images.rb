class CreateTopicImages < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_images do |t|
      t.string :image
      t.integer :topic_id

      t.timestamps
    end
  end
end
