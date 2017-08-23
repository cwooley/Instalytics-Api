class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :instagram_id
      t.string :user_name
      t.string :profile_picture_url
      t.string :comment_text
      t.integer :picture_id
      t.timestamps
    end
  end
end
