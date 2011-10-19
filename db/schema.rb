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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20111018184506) do
=======
ActiveRecord::Schema.define(:version => 20111018185852) do

  create_table "candidates", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "resume"
    t.string   "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end
>>>>>>> candidates

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "jobcount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["abbr"], :name => "index_companies_on_abbr", :unique => true
  add_index "companies", ["name"], :name => "index_companies_on_name", :unique => true

  create_table "messages", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.boolean  "confirm_send"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section"
  end

  create_table "orders", :force => true do |t|
    t.string   "order_id"
    t.integer  "user_id"
    t.string   "job_title"
    t.string   "job_type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.text     "description"
    t.integer  "position_max"
    t.integer  "positions_filled"
    t.integer  "stage"
    t.date     "closed_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.integer  "company_id"
    t.integer  "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
