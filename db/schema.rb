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

ActiveRecord::Schema.define(version: 20150906080856) do

  create_table "freeboards", force: :cascade do |t|
    t.string   "fb_name"
    t.string   "fb_title"
    t.text     "fb_content"
    t.string   "fb_password"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_applies", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.string   "major",      default: "", null: false
    t.string   "hakbun",     default: "", null: false
    t.string   "kakao",      default: "", null: false
    t.string   "phone_num",  default: "", null: false
    t.string   "email",      default: "", null: false
    t.string   "game",       default: "", null: false
    t.string   "team_name",  default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "freeboard_id"
    t.string   "rp_name"
    t.string   "rp_content"
    t.string   "rp_hakbun"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teamlists", force: :cascade do |t|
    t.string   "kind_of_game"
    t.string   "game_id"
    t.string   "tear"
    t.text     "comment"
    t.string   "hearthstone_major"
    t.string   "hearthstone_user_name"
    t.string   "fifa_major"
    t.string   "fifa_user_name"
    t.string   "lol_team_name"
    t.string   "lol_major"
    t.string   "lol_leader_id"
    t.string   "lol_user_id_1"
    t.string   "lol_user_id_2"
    t.string   "lol_user_id_3"
    t.string   "lol_user_id_4"
    t.string   "lol_leader_tear"
    t.string   "lol_tear_user_1"
    t.string   "lol_tear_user_2"
    t.string   "lol_tear_user_3"
    t.string   "lol_tear_user_4"
    t.string   "leader_name"
    t.string   "lol_member_name_1"
    t.string   "lol_member_name_2"
    t.string   "lol_member_name_3"
    t.string   "lol_member_name_4"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "major",                  default: "", null: false
    t.string   "hakbun",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
