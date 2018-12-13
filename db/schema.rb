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

ActiveRecord::Schema.define(version: 20181213142052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "course_attachments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_images", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "grade"
    t.integer  "period"
    t.string   "time"
    t.index ["user_id"], name: "index_courses_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "galleries", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "description"
  end

  create_table "gallery_images", force: :cascade do |t|
    t.integer  "gallery_id"
    t.string   "image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "description", default: ""
  end

  create_table "index_post_images", force: :cascade do |t|
    t.integer  "index_post_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "index_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "page_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["slug"], name: "index_index_posts_on_slug", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
    t.integer  "user_id"
    t.float    "rank"
    t.index ["topic_id"], name: "index_posts_on_topic_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "sponsored_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
    t.index ["topic_id"], name: "index_sponsored_posts_on_topic_id", using: :btree
  end

  create_table "topic_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
    t.integer  "user_id",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "role"
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "last_name",              default: "Last Name", null: false
    t.string   "avatar"
    t.string   "description",            default: ""
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  create_table "workshop_images", force: :cascade do |t|
    t.integer  "workshop_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "details",     null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "price"
    t.string   "instructor"
    t.string   "room"
    t.string   "time"
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
end
