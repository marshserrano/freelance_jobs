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

ActiveRecord::Schema.define(version: 2018_07_26_025027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_posts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "skills"
    t.float "budget"
    t.integer "hours_of_work"
    t.string "status", default: "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_job_posts_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "status", default: "pending"
    t.integer "sender_id"
    t.bigint "job_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipient_id"
    t.boolean "accepted", default: false
    t.boolean "completed", default: false
    t.index ["job_post_id"], name: "index_messages_on_job_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "job_title"
    t.string "brief_intro"
    t.text "summary"
    t.string "skills"
    t.string "location"
    t.float "rate"
  end

  add_foreign_key "job_posts", "users"
end
