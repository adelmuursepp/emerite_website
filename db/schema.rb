# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_17_095904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.bigint "topic_id"
    t.index ["topic_id"], name: "index_blogs_on_topic_id"
  end

  create_table "checkboxes", force: :cascade do |t|
    t.text "label"
    t.integer "checked"
    t.bigint "user_id"
    t.bigint "resource_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_item_id"], name: "index_checkboxes_on_resource_item_id"
    t.index ["user_id"], name: "index_checkboxes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "blog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.text "main_image"
    t.text "thumb_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.text "option1"
    t.text "option2"
    t.text "option3"
    t.text "explanation1"
    t.text "explanation2"
    t.text "explanation3"
    t.bigint "resource_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_item_id"], name: "index_questions_on_resource_item_id"
  end

  create_table "resource_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resource_comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "resource_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_item_id"], name: "index_resource_comments_on_resource_item_id"
    t.index ["user_id"], name: "index_resource_comments_on_user_id"
  end

  create_table "resource_items", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "body"
    t.bigint "resource_topic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.text "written_task"
    t.string "cdong_task"
    t.text "intro"
    t.index ["resource_topic_id"], name: "index_resource_items_on_resource_topic_id"
  end

  create_table "resource_topics", force: :cascade do |t|
    t.string "title"
    t.text "intro"
    t.bigint "resource_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_category_id"], name: "index_resource_topics_on_resource_category_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "roles"
    t.string "name"
    t.integer "sign_in_count", default: 0, null: false
    t.integer "failed_attempts", default: 30, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "topics"
  add_foreign_key "checkboxes", "resource_items"
  add_foreign_key "checkboxes", "users"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "users"
  add_foreign_key "questions", "resource_items"
  add_foreign_key "resource_comments", "resource_items"
  add_foreign_key "resource_comments", "users"
  add_foreign_key "resource_items", "resource_topics"
  add_foreign_key "resource_topics", "resource_categories"
end
