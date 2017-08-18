class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :instagram_id
      t.string :username
      t.string :full_name
      t.string :profile_picture_url
      t.integer :posts_count
      t.integer :followers_count
      t.integer :following_count

      t.timestamps
    end
  end
end
