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

ActiveRecord::Schema.define(version: 2022_07_16_051156) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "user_id", null: false
    t.bigint "drill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_comments_on_drill_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "drills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.integer "genre_id", null: false
    t.text "information", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "timer", default: 0
    t.index ["user_id"], name: "index_drills_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "drill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_favorites_on_drill_id"
    t.index ["user_id", "drill_id"], name: "index_favorites_on_user_id_and_drill_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "mylist_drills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mylist_id", null: false
    t.bigint "drill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_mylist_drills_on_drill_id"
    t.index ["mylist_id"], name: "index_mylist_drills_on_mylist_id"
  end

  create_table "mylists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mylists_on_user_id"
  end

  create_table "quizzes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "question", null: false
    t.string "choices_1", null: false
    t.string "choices_2", null: false
    t.string "choices_3", null: false
    t.string "choices_4", null: false
    t.integer "correct_answer", null: false
    t.bigint "drill_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_quizzes_on_drill_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "first_number_of_questions", default: 0
    t.integer "first_number_of_correct_answers", default: 0
    t.float "first_correct_answer_rate", default: 0.0
    t.integer "all_number_of_questions", default: 0
    t.integer "all_number_of_correct_answers", default: 0
    t.float "all_correct_answer_rate", default: 0.0
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "times", null: false
    t.integer "number_of_questions", null: false
    t.integer "number_of_correct_answers", null: false
    t.float "correct_answer_rate", null: false
    t.bigint "user_id", null: false
    t.bigint "drill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["drill_id"], name: "index_results_on_drill_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "drills"
  add_foreign_key "comments", "users"
  add_foreign_key "drills", "users"
  add_foreign_key "favorites", "drills"
  add_foreign_key "favorites", "users"
  add_foreign_key "mylist_drills", "drills"
  add_foreign_key "mylist_drills", "mylists"
  add_foreign_key "mylists", "users"
  add_foreign_key "quizzes", "drills"
  add_foreign_key "quizzes", "users"
  add_foreign_key "records", "users"
  add_foreign_key "results", "drills"
  add_foreign_key "results", "users"
end
