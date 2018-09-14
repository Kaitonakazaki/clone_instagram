ActiveRecord::Schema.define(version: 20180914113622) do

  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "instagram_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instagrams", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "icon"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
