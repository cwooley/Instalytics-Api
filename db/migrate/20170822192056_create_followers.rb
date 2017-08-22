class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.string :instagram_id
      t.string :username
      t.string :profile_picture_url
      t.integer :likes_count
      t.integer :comments_count
      t.timestamps
    end
  end
end
