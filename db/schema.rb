# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170822193458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "instagram_id"
    t.string "user_name"
    t.string "profile_picture_url"
    t.string "comment_text"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followers", force: :cascade do |t|
    t.integer "user_id"
    t.string "instagram_id"
    t.string "username"
    t.string "profile_picture_url"
    t.integer "likes_count"
    t.integer "comments_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "instagram_id"
    t.string "user_name"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "instagram_id"
    t.integer "user_id"
    t.integer "likes_count"
    t.integer "comments_count"
    t.datetime "created_time"
    t.string "standard_resolution_url"
    t.string "thumbnail_url"
    t.string "filter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "instagram_id"
    t.string "username"
    t.string "full_name"
    t.string "profile_picture_url"
    t.integer "posts_count"
    t.integer "followers_count"
    t.integer "following_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
  end

end
