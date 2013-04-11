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

ActiveRecord::Schema.define(:version => 20130410183554) do

  create_table "newspapers", :force => true do |t|
    t.string   "title"
    t.string   "editor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subscription_plans", :force => true do |t|
    t.integer  "price"
    t.boolean  "weekly"
    t.integer  "newspaper_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "subscription_plans", ["newspaper_id"], :name => "index_subscription_plans_on_newspaper_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "subscription_plan_id"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "subscriber_id"
  end

  add_index "subscriptions", ["subscriber_id", "subscription_plan_id"], :name => "index_subscriptions_on_subscriber_id_and_subscription_plan_id", :unique => true
  add_index "subscriptions", ["subscriber_id"], :name => "index_subscriptions_on_subscriber_id"
  add_index "subscriptions", ["subscription_plan_id"], :name => "index_subscriptions_on_subscription_plan_id"

  create_table "users", :force => true do |t|
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
