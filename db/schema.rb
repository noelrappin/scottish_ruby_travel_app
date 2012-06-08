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

ActiveRecord::Schema.define(:version => 20120608161518) do

  create_table "extras", :force => true do |t|
    t.integer  "trip_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "extras", ["trip_id"], :name => "index_extras_on_trip_id"

  create_table "hotels", :force => true do |t|
    t.integer  "trip_id"
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "hotels", ["trip_id"], :name => "index_hotels_on_trip_id"

  create_table "preferences", :force => true do |t|
    t.integer  "preferrer_id"
    t.string   "preferrer_type"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "preferences", ["preferrer_id"], :name => "index_preferences_on_preferrer_id"

  create_table "purchase_extras", :force => true do |t|
    t.integer  "extra_id"
    t.string   "extra_type"
    t.integer  "purchase_id"
    t.integer  "unit_count"
    t.float    "unit_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "purchase_extras", ["purchase_id"], :name => "index_purchase_extras_on_purchase_id"

  create_table "purchases", :force => true do |t|
    t.integer  "buyer_id"
    t.string   "buyer_type"
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.date     "purchase_date"
    t.date     "real_travel_date"
    t.float    "amount"
    t.integer  "length_of_stay"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "purchases", ["buyer_id"], :name => "index_purchases_on_buyer_id"
  add_index "purchases", ["purchasable_id"], :name => "index_purchases_on_purchasable_id"

  create_table "relationships", :force => true do |t|
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "relationships", ["receiver_id"], :name => "index_relationships_on_receiver_id"
  add_index "relationships", ["sender_id"], :name => "index_relationships_on_sender_id"

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "image_name"
    t.string   "slug"
    t.string   "tag_line"
    t.float    "price"
    t.string   "location"
    t.string   "activity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
