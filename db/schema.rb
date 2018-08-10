ActiveRecord::Schema.define(version: 2018_07_30_080446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_posts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "skills"
    t.float "budget"
    t.string "status", default: "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "hours_of_work"
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

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.integer "reviewer_id"
    t.integer "reviewee_id"
    t.bigint "job_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_post_id"], name: "index_reviews_on_job_post_id"
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
