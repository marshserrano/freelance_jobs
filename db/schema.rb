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

ActiveRecord::Schema.define(version: 2018_08_20_055453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "barangay"
    t.string "city_municipality"
    t.string "province"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.text "content"
    t.integer "status", default: 0
    t.integer "sender_id"
    t.integer "recipient_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_invites_on_post_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.text "content"
    t.integer "status", default: 0
    t.integer "sender_id"
    t.integer "recipient_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_job_applications_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "skills"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "hours_of_work"
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "reviewer_id"
    t.integer "reviewee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_reviews_on_post_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.string "job_title"
    t.string "brief_intro"
    t.text "summary"
    t.float "rate"
  end

  add_foreign_key "invites", "posts"
  add_foreign_key "job_applications", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "reviews", "posts"
end
