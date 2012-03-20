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

ActiveRecord::Schema.define(:version => 20120320154306) do

  create_table "message_logs", :force => true do |t|
    t.text     "to"
    t.text     "errors"
    t.boolean  "perform_deliveries"
    t.boolean  "bounced"
    t.boolean  "retryable"
    t.string   "message_id"
    t.string   "final_recipient"
    t.string   "action"
    t.string   "error_status"
    t.string   "diagnostic_code"
    t.string   "from"
    t.string   "delivery_method"
    t.string   "delivery_handler"
    t.string   "subject"
    t.string   "content_type"
    t.string   "charset"
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
  end

end
