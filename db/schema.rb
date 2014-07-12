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

ActiveRecord::Schema.define(version: 20140712212750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "festivals", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "lineup"
    t.string   "playlist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "flights", force: true do |t|
    t.string   "airline"
    t.string   "leg1_airport1"
    t.time     "leg1_time1"
    t.string   "leg1_airport2"
    t.string   "leg1_time2"
    t.string   "leg1_duration"
    t.string   "leg2_airport1"
    t.time     "leg2_time1"
    t.string   "leg2_airport2"
    t.string   "leg2_time2"
    t.string   "leg2_duration"
    t.string   "price"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchandises", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "gender"
    t.string   "price"
    t.string   "image"
    t.string   "url"
    t.string   "seller"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchandises_ravers", id: false, force: true do |t|
    t.integer "merchandise_id"
    t.integer "raver_id"
  end

  create_table "ravers", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "twitter_token"
    t.string   "twitter_token_secret"
    t.string   "facebook_uid"
    t.string   "facebook_token"
    t.string   "location"
    t.string   "lineup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "date"
    t.string   "lineup"
    t.integer  "raver_id"
    t.integer  "festival_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
