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

ActiveRecord::Schema.define(version: 20140518222349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "blocks", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
    t.boolean  "viewable"
  end

  add_index "blocks", ["cached_votes_down"], name: "index_blocks_on_cached_votes_down", using: :btree
  add_index "blocks", ["cached_votes_score"], name: "index_blocks_on_cached_votes_score", using: :btree
  add_index "blocks", ["cached_votes_total"], name: "index_blocks_on_cached_votes_total", using: :btree
  add_index "blocks", ["cached_votes_up"], name: "index_blocks_on_cached_votes_up", using: :btree
  add_index "blocks", ["cached_weighted_score"], name: "index_blocks_on_cached_weighted_score", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "block_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
    t.string   "name"
  end

  add_index "comments", ["block_id"], name: "index_comments_on_block_id", using: :btree
  add_index "comments", ["cached_votes_down"], name: "index_comments_on_cached_votes_down", using: :btree
  add_index "comments", ["cached_votes_score"], name: "index_comments_on_cached_votes_score", using: :btree
  add_index "comments", ["cached_votes_total"], name: "index_comments_on_cached_votes_total", using: :btree
  add_index "comments", ["cached_votes_up"], name: "index_comments_on_cached_votes_up", using: :btree
  add_index "comments", ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "subject"
    t.text     "body"
    t.datetime "sent"
    t.boolean  "read",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "searches", force: true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
