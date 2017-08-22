class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :instagram_id
      t.string :user_name
      t.integer :picture_id
      t.timestamps
    end
  end
end
