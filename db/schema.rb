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

ActiveRecord::Schema.define(version: 20150918045214) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "fightsubscription_fifas", force: :cascade do |t|
    t.string   "fifa_user_name",        default: "", null: false
    t.integer  "teamlist_fifa_id",                   null: false
    t.integer  "fifa_add_team_name_id",              null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "fightsubscription_hearthstones", force: :cascade do |t|
    t.string   "hearthstone_user_name",        default: "", null: false
    t.integer  "teamlist_hearthstone_id",                   null: false
    t.integer  "hearthstone_add_team_name_id",              null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "fightsubscriptions", force: :cascade do |t|
    t.text     "lol_subscription_team_name", default: "", null: false
    t.integer  "teamlist_lol_id",                         null: false
    t.integer  "lol_add_team_name_id",                    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

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

  create_table "teamlist_fifas", force: :cascade do |t|
    t.string   "game_id",              default: "",    null: false
    t.string   "tear",                 default: "",    null: false
    t.text     "comment",              default: "",    null: false
    t.integer  "fifa_current_user_id",                 null: false
    t.boolean  "fifa_whichgame",       default: false, null: false
    t.string   "fifa_opposing_team",   default: "",    null: false
    t.string   "fifa_major",           default: "",    null: false
    t.string   "fifa_user_name",       default: "",    null: false
    t.integer  "fifa_total_game",      default: 0,     null: false
    t.integer  "fifa_victory",         default: 0,     null: false
    t.integer  "fifa_lose",            default: 0,     null: false
    t.integer  "fifa_winner_point",    default: 0,     null: false
    t.integer  "fifa_winning_rate",    default: 0,     null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "teamlist_hearthstones", force: :cascade do |t|
    t.string   "game_id",                     default: "",    null: false
    t.string   "tear",                        default: "",    null: false
    t.text     "comment",                     default: "",    null: false
    t.integer  "hearthstone_current_user_id",                 null: false
    t.boolean  "hearthstone_whichgame",       default: false, null: false
    t.string   "hearthstone_opposing_team",   default: "",    null: false
    t.string   "hearthstone_major",           default: "",    null: false
    t.string   "hearthstone_user_name",       default: "",    null: false
    t.integer  "hearthstone_total_game",      default: 0,     null: false
    t.integer  "hearthstone_victory",         default: 0,     null: false
    t.integer  "hearthstone_lose",            default: 0,     null: false
    t.integer  "hearthstone_winner_point",    default: 0,     null: false
    t.integer  "hearthstone_winning_rate",    default: 0,     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "teamlist_lols", force: :cascade do |t|
    t.boolean  "lol_whichgame",       default: false, null: false
    t.string   "lol_opposing_team",   default: "",    null: false
    t.string   "lol_team_name",       default: "",    null: false
    t.integer  "lol_current_user_id",                 null: false
    t.text     "comment",             default: "",    null: false
    t.string   "lol_leader_id",       default: "",    null: false
    t.string   "lol_user_id_1",       default: "",    null: false
    t.string   "lol_user_id_2",       default: "",    null: false
    t.string   "lol_user_id_3",       default: "",    null: false
    t.string   "lol_user_id_4",       default: "",    null: false
    t.string   "lol_leader_tear",     default: "",    null: false
    t.string   "lol_tear_user_1",     default: "",    null: false
    t.string   "lol_tear_user_2",     default: "",    null: false
    t.string   "lol_tear_user_3",     default: "",    null: false
    t.string   "lol_tear_user_4",     default: "",    null: false
    t.string   "leader_name",         default: "",    null: false
    t.string   "lol_member_name_1",   default: "",    null: false
    t.string   "lol_member_name_2",   default: "",    null: false
    t.string   "lol_member_name_3",   default: "",    null: false
    t.string   "lol_member_name_4",   default: "",    null: false
    t.string   "lol_major",           default: "",    null: false
    t.string   "lol_member_major_1",  default: "",    null: false
    t.string   "lol_member_major_2",  default: "",    null: false
    t.string   "lol_member_major_3",  default: "",    null: false
    t.string   "lol_member_major_4",  default: "",    null: false
    t.integer  "lol_total_game",      default: 0,     null: false
    t.integer  "lol_victory",         default: 0,     null: false
    t.integer  "lol_lose",            default: 0,     null: false
    t.integer  "lol_winner_point",    default: 0,     null: false
    t.integer  "lol_winning_rate",    default: 0,     null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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

  create_table "whichgame_fifas", force: :cascade do |t|
    t.integer  "fifa_whichgame_my_id",             default: 0
    t.integer  "fifa_whichgame_opposing_id",       default: 0
    t.string   "fifa_whichgame_my_teamname",       default: ""
    t.string   "fifa_whichgame_opposing_teamname", default: ""
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "whichgame_hearthstones", force: :cascade do |t|
    t.integer  "hearthstone_whichgame_my_id",             default: 0
    t.integer  "hearthstone_whichgame_opposing_id",       default: 0
    t.string   "hearthstone_whichgame_my_teamname",       default: ""
    t.string   "hearthstone_whichgame_opposing_teamname", default: ""
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "whichgames", force: :cascade do |t|
    t.integer  "lol_whichgame_my_id",             default: 0
    t.integer  "lol_whichgame_opposing_id",       default: 0
    t.string   "lol_whichgame_my_teamname",       default: ""
    t.string   "lol_whichgame_opposing_teamname", default: ""
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

end
