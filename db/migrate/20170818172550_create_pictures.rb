class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :likes_count
      t.integer :comments_count
      t.datetime :created_time
      t.string :standard_resolution_url
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
