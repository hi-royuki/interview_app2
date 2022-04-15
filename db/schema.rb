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

ActiveRecord::Schema.define(version: 2022_04_15_142230) do

  create_table "company_names", force: :cascade do |t|
    t.integer "user_id"
    t.date "interview_date"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_name_id"
    t.text "content"
    t.text "answer"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "company_name"
    t.string "number"
    t.string "type"
    t.string "question_a"
    t.string "question_b"
    t.string "question_c"
    t.string "question_d"
    t.string "question_e"
    t.string "question_f"
    t.string "question_g"
    t.string "question_h"
    t.string "question_i"
    t.string "question_j"
    t.string "question_k"
    t.string "question_l"
    t.string "question_m"
    t.string "question_n"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
