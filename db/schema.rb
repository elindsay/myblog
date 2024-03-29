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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130112052950) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feelings", :force => true do |t|
    t.string  "name"
    t.string  "header_feeling"
    t.boolean "head"
  end

  create_table "needs", :force => true do |t|
    t.string  "name"
    t.string  "header_need"
    t.boolean "head"
  end

  create_table "nvc_trigger_journal_entries", :force => true do |t|
    t.integer  "user_id"
    t.text     "trigger_object"
    t.text     "my_feelings"
    t.text     "my_needs"
    t.text     "my_request"
    t.text     "her_his_feelings"
    t.text     "her_his_needs"
    t.text     "my_amended_request"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
