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

ActiveRecord::Schema.define(version: 20150527152408) do

  create_table "classrooms", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms_documents", id: false, force: :cascade do |t|
    t.integer "classroom_id"
    t.integer "document_id"
  end

  add_index "classrooms_documents", ["classroom_id"], name: "index_classrooms_documents_on_classroom_id"
  add_index "classrooms_documents", ["document_id"], name: "index_classrooms_documents_on_document_id"

  create_table "classrooms_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "classroom_id"
  end

  add_index "classrooms_users", ["classroom_id"], name: "index_classrooms_users_on_classroom_id"
  add_index "classrooms_users", ["user_id"], name: "index_classrooms_users_on_user_id"

  create_table "documents", force: :cascade do |t|
    t.integer  "classroom_id"
    t.string   "name"
    t.string   "author_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "content"
  end

  add_index "documents", ["classroom_id"], name: "index_documents_on_classroom_id"

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "surname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_classrooms", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "classroom_id"
  end

  add_index "users_classrooms", ["classroom_id"], name: "index_users_classrooms_on_classroom_id"
  add_index "users_classrooms", ["user_id"], name: "index_users_classrooms_on_user_id"

end
