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

ActiveRecord::Schema.define(version: 20140710145211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appearances", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "festival_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "website"
    t.string "description"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "festivals", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.string "playlist"
    t.string "image"
    t.string "status"
    t.string "ticket_link"
    t.text "prices"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "airline"
    t.string "leg1"
    t.string "leg2"
    t.string "price"
    t.string "link"
    t.integer "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandises", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "gender"
    t.string "price"
    t.string "image"
    t.string "url"
    t.string "seller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandises_ravers", id: false, force: :cascade do |t|
    t.integer "merchandise_id"
    t.integer "raver_id"
  end

  create_table "ravers", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "twitter_token"
    t.string "twitter_token_secret"
    t.string "facebook_uid"
    t.string "facebook_token"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "date"
    t.string "lineup"
    t.date "start_date"
    t.date "end_date"
    t.string "from_airport"
    t.string "to_airport"
    t.bigint "raver_id"
    t.bigint "festival_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["festival_id"], name: "index_trips_on_festival_id"
    t.index ["raver_id"], name: "index_trips_on_raver_id"
  end

end
