# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150820052735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "camps", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "parent_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.datetime "background_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "replies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "topic_id"
  end

  add_index "replies", ["topic_id"], name: "index_replies_on_topic_id", using: :btree

  create_table "topic_attachments", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "topic_id"
    t.string   "fingerprint"
  end

  add_index "topic_attachments", ["topic_id"], name: "index_topic_attachments_on_topic_id", using: :btree

  create_table "topic_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "topic_id"
  end

  add_index "topic_likes", ["topic_id"], name: "index_topic_likes_on_topic_id", using: :btree
  add_index "topic_likes", ["user_id"], name: "index_topic_likes_on_user_id", using: :btree

  create_table "topic_views", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "topic_id"
  end

  add_index "topic_views", ["topic_id"], name: "index_topic_views_on_topic_id", using: :btree
  add_index "topic_views", ["user_id"], name: "index_topic_views_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.text     "raw_content"
    t.text     "cooked"
  end

  add_index "topics", ["category_id"], name: "index_topics_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",              default: "", null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "salt",                            null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "replies", "topics"
  add_foreign_key "topic_attachments", "topics"
  add_foreign_key "topic_likes", "topics"
  add_foreign_key "topic_views", "topics"
  add_foreign_key "topics", "categories"
end
